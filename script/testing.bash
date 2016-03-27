reset_expectations() {
    failures=()
    assert_no_failures=true
}

report_any_failures() {
    local IFS=
    printf "%s" "${failures[*]}"
    $assert_no_failures
}

expect_success() {
    ( "$@"; ) || {
        local actual_exit_code="$?"
        failures+=(
"Failed expectation for command: \`$*'
 - expected success (exit code == 0)
 - got failure (exit code == $actual_exit_code)
")
        assert_no_failures=false
    }
}

expect_output() {
    local expected_output="$1"; shift
    local command="$*"
    local actual_output="$( "$@"; )"
    [[ "$actual_output" == "$expected_output" ]] || {
        failures+=(
"Failed expectation for command: \`$command'
 - expected output: $expected_output
 -   actual output: $actual_output
")
        assert_no_failures=false
    }
}

echo_out_and_err() {
    echo "$1"
    echo_on_stderr "$2"
}

echo_on_stderr() {
    echo "$1" 1>&2
}

stderr_only_of() {
    "$@" 2>&1 1>/dev/null || true
}

stdout_only_of() {
    "$@" 2>/dev/null || true
}

expect_output \
    'Error' \
    stderr_only_of echo_on_stderr 'Error'

expect_output \
    'out' \
    stdout_only_of echo_out_and_err 'out' 'err1'

expect_output \
    'out' \
    stdout_only_of echo_out_and_err 'out' 'err'

expect_output \
    '' \
    stderr_only_of stdout_only_of echo_out_and_err 'out' 'err'

expect_success true
expect_output 'foo
bar' \
    echo 'foo
bar'


