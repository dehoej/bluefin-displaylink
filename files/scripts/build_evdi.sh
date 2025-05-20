KERN=${1:-$(ls /usr/src/kernels | head --lines=1)}
#MOK_KEY=${2:-/var/lib/dkms/mok.key}
#MOK_DER=${3:-/var/lib/dkms/mok.der }

set -e

echo "Installing kmod-evdi"
dnf install -y kmod-evdi displaylink

echo "Building evdi kmod for $KERN"
akmods --force --kernels $KERN --akmod evdi

echo "Listing evdi module:"
ls -l /usr/lib/modules/$KERN/extra/evdi

# echo "Signing kmod"
# echo "MOK_KEY: $MOK_KEY"
# echo "MOK_DER: $MOK_DER"
# /usr/src/kernels/$KERN/scripts/sign-file sha256 $MOK_KEY $MOK_DER /usr/lib/modules/$KERN/extra/evdi/evdi.ko.xz
