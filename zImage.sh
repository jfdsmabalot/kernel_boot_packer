./scripts/extract-ramdisk.pl boot.img
./tools/mkbootfs boot.img-ramdisk | gzip > ramdisk.gz
cmd_line=`scripts/get_cmdline`
ramdisk_addr=`scripts/get_ramdisk_addr`
base=`scripts/get_kernel_base_addr`

if [ "$cmd_line" == "" ]
then
  ./tools/mkbootimg --kernel zImage --ramdisk ramdisk.gz -o kernel.img --base $base $ramdisk_params
else
  ./tools/mkbootimg --kernel zImage --ramdisk ramdisk.gz --cmdline "$cmd_line" -o kernel.img --base $base $ramdisk_params
fi


rm -r boot.img-ramdisk
rm ramdisk.gz

