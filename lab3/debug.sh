make os.img
objdump -d bootloader/bootloader.elf > bootloader.s
objdump -d kernel/kMain.elf > kMain.s
objdump -d app/uMain.elf > uMain.s
make debug
rm bootloader.s
make clean
