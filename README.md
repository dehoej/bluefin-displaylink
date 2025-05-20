# bluefin-displaylink &nbsp; [![bluebuild build badge](https://github.com/dehoej/bluefin-displaylink/actions/workflows/build.yml/badge.svg)](https://github.com/dehoej/bluefin-displaylink/actions/workflows/build.yml)

This is a bluefin image with displaylink and evdi. It exists in a stable and a gts image-version. It is always based directly on https://github.com/ublue-os/bluefin.
There is a bluefin-displaylink package and a bluefin-displaylink-dx package. This has mainly been created for me to be able to use a Lenovo Displaylink based dock with dual monitor in combination with my P14s gen 5 AMD Ryzen PRO.

[!NOTE]
In this repo stable and latest is the same

## Installation

> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/dehoej/bluefin-displaylink:stable
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/dehoej/bluefin-displaylink:stable
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/dehoej/bluefin-displaylink-amd
```
