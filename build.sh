export IODINE_ARCH=x86_64
export IODINE_VERSION=1.19.0-alpha

sudo setarch $IODINE_ARCH livecd-creator --verbose --debug --plugins \
--config=iodine-livecd.ks \
--fslabel=linux-iodine-$IODINE_ARCH-$IODINE_VERSION \
--cache=/var/cache/live 
