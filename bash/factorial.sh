#!/usr/bin/env bash
set -euo pipefail

factorial() {
    local input=${1-} n result=1 i
    if [[ ! $input =~ ^(0|[1-9][0-9]?)$ ]]; then
        printf 'Expected an integer from 0 to 20\n' >&2
        return 2
    fi
    n=$((10#$input))
    if (( n > 20 )); then
        printf 'Expected an integer from 0 to 20\n' >&2
        return 2
    fi
    for ((i=2; i<=n; i++)); do
        result=$((result * i))
    done
    printf '%s\n' "$result"
}

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    if (( $# != 1 )); then
        printf 'Usage: %s N\n' "$0" >&2
        exit 2
    fi
    factorial "$1"
fi
