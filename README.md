# Dev Container Feature: jemalloc

A feature for a dev container that installs the jemalloc allocator library.
It's meant as an addition to the Swift 5.7 (and later) images to install supporting
C libraries.

Example using the feature:

```jsonc
{
    "image": "swift:5.7",
    "features": {
        "ghcr.io/swift-server-community/swift-devcontainer-features/jemalloc:1": { },
        "ghcr.io/swift-server-community/swift-devcontainer-features/sqlite:1": { },
        "ghcr.io/swift-server-community/swift-devcontainer-features/foundationnetworking:1": { }
    }
}
```

## Testing

using the devcontainer CLI:

```bash
devcontainer features test --skip-autogenerated -f jemalloc -i ubuntu:latest .
devcontainer features test --skip-scenarios -f jemalloc -i ubuntu:latest .

devcontainer features test --skip-autogenerated -f sqlite -i ubuntu:latest .
devcontainer features test --skip-scenarios -f sqlite -i ubuntu:latest .

devcontainer features test --skip-autogenerated -f foundationnetworking -i ubuntu:latest .
devcontainer features test --skip-scenarios -f foundationnetworking -i ubuntu:latest .

devcontainer features test --global-scenarios-only -i ubuntu:latest .
```
