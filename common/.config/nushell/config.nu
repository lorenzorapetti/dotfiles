# config.nu
#
# Installed by:
# version = "0.106.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

source ($nu.default-config-dir | path join "theme.nu")

# ------------------------
# Configuration
# ------------------------

$env.config.history.file_format = "sqlite"
$env.config.history.max_size = 5_000_000

$env.config.show_banner = false
$env.config.rm.always_trash = true

$env.config.edit_mode = "vi"
$env.config.buffer_editor = "nvim"

$env.config.use_kitty_protocol = true

$env.config.datetime_format.normal = "%d/%m/%y %I:%M:%S%p"

# ------------------------
# Environment Variables
# ------------------------

$env.VISUAL = "nvim"
$env.EDITOR = "nvim"
$env.XDG_CONFIG_HOME = $"($env.HOME)/.config"
$env.CARGO_HOME = $"($env.HOME)/.cargo"
$env.BUN_INSTALL = $"($env.HOME)/.bun"

source (if (($nu.default-config-dir | path join "secrets.nu") | path expand | path exists) {($nu.default-config-dir | path join "secrets.nu")} else { null })

# ------------------------
# Paths
# ------------------------

use std/util "path add"
path add "/opt/homebrew/bin"
path add "/opt/homebrew/opt"
path add $"($env.HOME)/.local/bin"
path add $"($env.CARGO_HOME)/bin"
path add $"($env.BUN_INSTALL)/bin"

# ------------------------
# Aliases
# ------------------------

source ($nu.default-config-dir | path join "aliases.nu")

# ------------------------
# Plugins
# ------------------------

use ($nu.default-config-dir | path join mise.nu)

source ~/.zoxide.nu

source ~/.cache/carapace/init.nu

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
