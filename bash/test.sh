#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
# shellcheck source=bash/factorial.sh
source ./factorial.sh
total=0
failed=0

check() {
    local label=$1 input=$2 expected=$3 expected_status=$4
    local output status=0
    output=$(factorial "$input" 2>/dev/null) || status=$?
    total=$((total + 1))
    if [[ $output == "$expected" && $status == "$expected_status" ]]; then
        printf 'ok %s - %s\n' "$total" "$label"
    else
        printf 'not ok %s - %s (output=%s status=%s)\n' \
            "$total" "$label" "$output" "$status"
        failed=$((failed + 1))
    fi
}

printf '1..7\n'
check '0! = 1' 0 1 0
check '1! = 1' 1 1 0
check '5! = 120' 5 120 0
check '20! = 2432902008176640000' 20 2432902008176640000 0
check 'negative input rejected' -1 '' 2
check 'fractional input rejected' 1.5 '' 2
check 'overflow input rejected' 21 '' 2
printf '# tests=%s passed=%s failed=%s\n' "$total" "$((total-failed))" "$failed"
(( failed == 0 ))
