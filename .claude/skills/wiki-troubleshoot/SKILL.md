---
name: wiki-troubleshoot
description: Search the Arch Wiki and CachyOS Wiki to troubleshoot a Linux problem (boot, drivers, audio/Bluetooth, Hyprland/Wayland, pacman/paru, systemd, kernel, etc.). Use when the user reports a system issue on their Arch/CachyOS machine or asks "how do I fix/configure X" for the OS.
---

# Wiki Troubleshoot

Research a system problem against the two authoritative sources for this machine — the **Arch Wiki** (`wiki.archlinux.org`) and the **CachyOS Wiki** (`wiki.cachyos.org`) — then give a fix grounded in what those pages actually say.

This repo is a CachyOS (Arch-based) + Hyprland/Wayland setup. CachyOS-specific behavior (custom kernels, repos, `cachyos-*` packages, scheduler/BORE tweaks) lives in the CachyOS wiki; everything else is almost always covered by the Arch Wiki, which is the deeper source.

## Steps

1. **Gather local context first.** A correct answer usually depends on the actual system state, not just the wiki. Pull only what's relevant to the problem, e.g.:
   - `uname -a` and `cat /etc/os-release` (kernel + distro confirmation)
   - `journalctl -b -p err` or `journalctl -u <unit>` for errors
   - `pacman -Q <pkg>` to check what's installed; `systemctl status <unit>` / `systemctl --user status <unit>`
   - For hardware: `lspci`, `lsusb`, `inxi -Fxz` if available
   Skip this only if the user already pasted the relevant output.

2. **Search both wikis.** Use `WebSearch` scoped to each domain, then `WebFetch` the most relevant pages to read the actual instructions. Run the searches in parallel:
   - `site:wiki.archlinux.org <problem keywords>`
   - `site:wiki.cachyos.org <problem keywords>`
   Prefer the CachyOS page when the issue touches CachyOS-specific kernels/repos/packages; otherwise lead with the Arch Wiki. Always read the page rather than answering from the search snippet.

3. **Cross-check against this machine.** Reconcile the wiki guidance with the local context from step 1 (e.g. the wiki says enable a service that's already running, or a config that conflicts with something in this dotfiles repo under `common/`, `linux/`, or the Hyprland Lua config). Note any mismatch.

4. **Answer with citations.** Give the concrete fix as commands/steps, each tied to the wiki section it came from with the page URL. Distinguish what's confirmed by the wiki from your own inference. Flag anything destructive (partition/bootloader/kernel changes) and confirm before running it.

## Guidance

- These wikis are the source of truth — do not invent commands or `pacman`/`paru` package names; verify them on the page or with `pacman -Ss` / `pacman -F`.
- If the wikis disagree or neither covers it, say so plainly rather than guessing; suggest the Arch forums / CachyOS Discord as next steps.
- If a fix means editing files in this repo, point at the right tree (`common/` cross-platform, `linux/` desktop, Hyprland config is Lua) and remember configs are deployed via `stow --no-folding` (see CLAUDE.md).
