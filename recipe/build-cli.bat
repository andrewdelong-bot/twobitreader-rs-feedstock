@echo on

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
if errorlevel 1 exit 1

set CARGO_PROFILE_RELEASE_STRIP=symbols
cargo install --locked --features cli --no-track --bins --root "%LIBRARY_PREFIX%" --path .
if errorlevel 1 exit 1
