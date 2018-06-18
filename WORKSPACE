workspace(name = "bazel_demo")

git_repository(
    name = "build_bazel_rules_nodejs",
    remote = "https://github.com/bazelbuild/rules_nodejs.git",
    tag = "0.9.1",
)

load("@build_bazel_rules_nodejs//:defs.bzl", "node_repositories")

node_repositories(
    package_json = ["//:package.json"],
    node_version = "8.11.1",
    yarn_version = "1.5.1",
)
