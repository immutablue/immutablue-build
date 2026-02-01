# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**immutablue-build** is a build orchestration system for the Immutablue ecosystem. It clones multiple Immutablue-related repositories and orchestrates the building of various Linux distribution variants as container images, publishing them to Quay.io.

## Build Commands

```bash
make clone              # Clone all required repositories
make deps               # Build and push dependency images
make main               # Build base immutablue variants (ZFS enabled) + nucleus + dbox-fedora
make main_lts           # Build LTS variants
make derivatives        # Build kuberblue and trueblue variants
make nvidia             # Build CYAN (NVIDIA GPU) variants
make downstream         # Build downstream projects (hyacinth-macaw, etc.)
make downstream-nvidia  # Build downstream NVIDIA variants
make all                # Build main, nvidia, downstream, downstream-nvidia
make clean              # Remove all cloned repositories
```

## Build Flags

Flags passed to the immutablue Makefile:

| Flag | Purpose |
|------|---------|
| `ZFS=1` | Enable ZFS support (default for base immutablue) |
| `CYAN=1` | NVIDIA GPU support |
| `NUCLEUS=1` | Minimal variant |
| `KINOITE=1` | KDE desktop variant |
| `VAUXITE=1` | Xfce desktop variant |
| `LAZURITE=1` | LXQt desktop variant |
| `KUBERBLUE=1` | Kubernetes-focused variant |
| `TRUEBLUE=1` | Enterprise variant (inherently LTS) |
| `NIX=1` | Nix package manager integration |
| `LTS=1` | Long-term support version |
| `NVIDIA=1` | Used by downstream projects for NVIDIA builds |

## Architecture

Hub-and-spoke model where this repo orchestrates builds across multiple cloned repositories:

**Primary (from immutablue/immutablue):**
- immutablue (base), kinoite, vauxite, lazurite, nucleus, cyan, lts, nix variants
- kuberblue and trueblue derivatives with various combinations

**Downstream projects:**
- hyacinth-macaw (immutablue/hyacinth-macaw)
- blue-tuxonaut (noahsibai/blue-tuxonaut)
- hawk-blueah (immutablue/hawk-blueah)
- dbox-fedora (immutablue/dbox-fedora)

## Automated Builds

- `scripts/build-job.sh` - Full build pipeline with optional `--prune` flag
- `systemd/immutablue-build.timer` - Schedules builds at 00:00, 08:00, 16:00

## Requirements

- buildah (container image building)
- git
- make
- Quay.io authentication in `~/.config/containers/auth.json`

## Notes

- NVIDIA builds (`make nvidia`, `make downstream-nvidia`) are allowed to fail without stopping the pipeline
- trueblue is inherently LTS and does not use the LTS=1 flag
- Repositories using submodules: immutablue, hyacinth-macaw (cloned with `--recurse-submodules`)
