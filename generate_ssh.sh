#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 -h <target_hostname> -i <target_ip> [-u <target_user>]"
  echo "  -h : Target hostname (required)"
  echo "  -i : Target IP address (required)"
  echo "  -u : Target username (optional, default: 'root')"
  exit 1
}

while getopts ":h:i:u:" opt; do
  case ''${opt} in
    h )
      target_hostname=$OPTARG
      ;;
    i )
      target_ip=$OPTARG
      ;;
    u )
      target_user=$OPTARG
      ;;
    \? ) # Invalid Option
      echo "Invalid option: -$OPTARG" 1>&2
      usage
      ;;
    : ) # Option requires an argument, but none provided
      echo "Invalid option: -$OPTARG requires an argument" 1>&2
      usage
      ;;
  esac
done

temp = $(mktemp -d)

cleanup() {
  rm -rf "$temp"
}
trap cleanup EXIT


shift $((OPTIND -1))

if [[ -z "$target_hostname" ]]; then
  echo "Error: Target hostname (-h) is required." 1>&2
  usage
fi
if [[ -z "$target_ip" ]]; then
  echo "Error: Target IP address (-i) is required." 1>&2
  usage
fi

echo "---Generating SSH and installing to: "
echo "$target_hostname, $target_user@$target_ip"
echo "-------------------------------------"


install -d -m755 "$temp/etc/ssh"
ssh-keygen -t ed25519 -N "" -C "${target_hostname}" -f $temp/etc/ssh/ssh_host_ed25519_key
chmod 600 "$temp/etc/ssh/ssh_host_ed25519_key"

age_key=$(cat $temp/etc/ssh/ssh_host_ed25519_key.pub | ${pkgs.ssh-to-age}/bin/ssh-to-age)

echo "Generated Age Key: ${age_key}"
echo "Adding age keys to .sops.yaml"
sed -i "/keys:/a\  - &{{host}} {{agekey}}" .sops.yaml
sed -i "/- age:/a\        - *{{host}}" .sops.yaml

sops updatekeys
