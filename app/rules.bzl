CMD = """#!/bin/bash
# --- begin runfiles.bash initialization v2 ---
# Copy-pasted from the Bazel Bash runfiles library v2.
set -uo pipefail; f=bazel_tools/tools/bash/runfiles/runfiles.bash
source "${RUNFILES_DIR:-/dev/null}/$f" 2>/dev/null || \
  source "$(grep -sm1 "^$f " "${RUNFILES_MANIFEST_FILE:-/dev/null}" | cut -f2- -d' ')" 2>/dev/null || \
  source "$0.runfiles/$f" 2>/dev/null || \
  source "$(grep -sm1 "^$f " "$0.runfiles_manifest" | cut -f2- -d' ')" 2>/dev/null || \
  source "$(grep -sm1 "^$f " "$0.exe.runfiles_manifest" | cut -f2- -d' ')" 2>/dev/null || \
  { echo>&2 "ERROR: cannot find $f"; exit 1; }; f=; set -e
# --- end runfiles.bash initialization v2 ---
runfiles_export_envvars
TEST_SRCDIR=$RUNFILES_DIR $(rlocation {app}) {say}
"""

def _runner_impl(ctx):
    runfiles = ctx.runfiles()
    runfiles = runfiles.merge(ctx.attr._bash_runfiles.default_runfiles)
    runfiles = runfiles.merge(ctx.attr.app.default_runfiles)

    cmd = CMD.replace("{app}", "/".join([ctx.workspace_name, ctx.executable.app.short_path])).replace("{say}", ctx.attr.say)

    ctx.actions.write(ctx.outputs.executable, cmd)

    return [
        DefaultInfo(
            runfiles = runfiles,
        ),
    ]

runner = rule(
    implementation = _runner_impl,
    executable = True,
    attrs = {
        "app": attr.label(
            executable = True,
            mandatory = True,
            cfg = "target",
        ),
        "say": attr.string(
            default = "world",
        ),
        "_bash_runfiles": attr.label(
            allow_files = True,
            default = "@bazel_tools//tools/bash/runfiles",
        ),
    },
)
