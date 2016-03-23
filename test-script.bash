set -o errexit
assert_no_failures=true
expect_success() {
    ( "$@"; ) || {
        local actual_exit_code="$?"
        echo "Failed expectation for command: \`$*'"
        echo " - expected success (exit code == 0) got failure (exit code == $actual_exit_code)"
        assert_no_failures=false
    }
}
expect_success false
$assert_no_failures