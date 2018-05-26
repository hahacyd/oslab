QEMU = qemu-system-i386

os.img:
	@cd bootloader; make
	@cd kernel; make
	@cd app; make
	cat bootloader/bootloader.bin kernel/kMain.elf app/uMain.elf > os.img
	objdump -d kernel/kMain.elf > kMain.s
	objdump -d app/uMain.elf > uMain.s

play: os.img
	$(QEMU) -serial stdio os.img

debug: os.img
	$(QEMU) -serial stdio -s -S os.img
submit:
	@cd ../relative;mkdir lab;mkdir report;cp lab4实验报告.pdf report;
	cp -r . ../relative/lab/

	@cd ../relative;zip -r lab4-161220019.zip lab report
clean:
	@cd bootloader; make clean
	@cd kernel; make clean
	@cd app; make clean
	rm -f os.img
