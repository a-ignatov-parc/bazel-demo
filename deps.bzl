load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def demo_repo():
    http_archive(
        name = "build_bazel_rules_nodejs",
        sha256 = "8dc1466f8563f3aa4ac7ab7aa3c96651eb7764108219f40b2d1c918e1a81c601",
        urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/0.41.0/rules_nodejs-0.41.0.tar.gz"],
    )
