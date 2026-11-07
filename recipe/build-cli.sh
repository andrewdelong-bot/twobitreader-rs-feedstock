#!/bin/bash
set -euxo pipefail

# Rust statically links every crate into the binary, so their licences must be packaged too.
cargo-bundle-licenses --format yaml --output THIRDPARTY.yml

export CARGO_PROFILE_RELEASE_STRIP=symbols
cargo install --locked --features cli --no-track --bins --root "${PREFIX}" --path .
