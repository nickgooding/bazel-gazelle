load(
    "//internal:go_repository_cache.bzl",
    "go_repository_cache",
)
load(
    "//internal:go_repository_tools.bzl",
    "go_repository_tools",
)
load(
    "//internal:go_repository_config.bzl",
    "go_repository_config",
)

def _non_module_deps_impl(module_ctx):
    go_repository_cache(
        name = "bazel_gazelle_go_repository_cache",
        # Always provided by rules_go.
        go_sdk_name = "go_default_sdk",
        go_env = {},
    )
    go_repository_tools(
        name = "bazel_gazelle_go_repository_tools",
        go_cache = Label("@bazel_gazelle_go_repository_cache//:go.env"),
    )
    go_repository_config(
        name = "bazel_gazelle_go_repository_config",
        # Generated by the go_dep module extension.
        config = Label("@bazel_gazelle_go_repository_directives//:WORKSPACE"),
    )

non_module_deps = module_extension(
    _non_module_deps_impl,
)
