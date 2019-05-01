workspace(name = "bazel_demo")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "4c702ffeeab2d24dd4101601b6d27cf582d2e0d4cdc3abefddd4834664669b6b",
    urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/0.28.0/rules_nodejs-0.28.0.tar.gz"],
)

load("@build_bazel_rules_nodejs//:defs.bzl", "yarn_install")
yarn_install(
    name = "npm",
    package_json = "//:package.json",
    yarn_lock = "//:yarn.lock",
)

load("@npm//:install_bazel_dependencies.bzl", "install_bazel_dependencies")
install_bazel_dependencies()

load("@npm_bazel_typescript//:index.bzl", "ts_setup_workspace")
ts_setup_workspace()
