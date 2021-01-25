#  Magno's dotfiles

![Preview](preview.png)

## Installation

**Warning**: If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

### Using `curl`

```bash
curl -L https://raw.githubusercontent.com/magnobiet/dotfiles-macos/master/bootstrap.sh | bash
```

### Using `wget`

```bash
wget -q -O - https://raw.githubusercontent.com/magnobiet/dotfiles-macos/master/bootstrap.sh | bash
```

### Or using `git`

```bash
# HTTPS
git clone https://github.com/magnobiet/dotfiles-macos.git .dotfiles && cd $_

# SSH
```bash
git clone git@github.com:magnobiet/dotfiles-macos.git .dotfiles && cd $_

./bootstrap.sh

# Optional
./apps.sh --work --games --rpi --office --btc --sport --vm --heroku --sync
./mobile.sh
./node.sh
./homestead.sh
```

## License

This project is licensed under the [MIT License](https://magno.mit-license.org/2021). Copyright © Magno Biét
