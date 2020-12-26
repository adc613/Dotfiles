curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

# Rust assumes that C linker is installed 
# https://stackoverflow.com/questions/52445961/how-do-i-fix-the-rust-error-linker-cc-not-found-for-debian-on-windows-10
sudo apt install build-essential

# Install rust toolchain components
rustup component add rls rust-analysis rust-src
