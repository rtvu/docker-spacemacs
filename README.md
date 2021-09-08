# Spacemacs - Docker Application

Container for Spacemacs.

## Notes

* GUI is enabled by forwarding host's X socket.
* Container is running in `privileged mode`.
* Container's `.emacs.d` is persisted in a volume.
* `./.spacemacs.d` is mounted into container.
* `./org` is mounted into container.

## Scripts

* `build-container`: builds container with user's UID and GID
* `launch-container`: launches container
* `install-spacemacs`: run inside container to install/reinstall spacemacs `.emacs.d`

## Usage

```bash
# On host
> ./build-container
> ./launch-container

# Inside container
> ./install-spacemacs # Only if spacemacs is not configured
> emacs
```
