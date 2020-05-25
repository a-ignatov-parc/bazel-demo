load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def demo_repo():
    http_archive(
        name = "build_bazel_rules_nodejs",
        sha256 = "d14076339deb08e5460c221fae5c5e9605d2ef4848eee1f0c81c9ffdc1ab31c1",
        urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/1.6.1/rules_nodejs-1.6.1.tar.gz"],
    )
