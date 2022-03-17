#!/bin/bash

set -euo pipefail

user="$1"

user=$(curl -1sLf -H "authorization: Bearer $GITHUB_API_TOKEN" -H "Accept: application/vnd.github.v3+json" https://api.github.com/orgs/redpanda-data/members?per_page=1000 | jq -r ".[] | select(.login==\"$user\")")

if [[ -n "$user" ]]; then
	exit 0
fi
exit 2
