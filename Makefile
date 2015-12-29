all: ppd

clean:
	@echo -e "\e[32mRemoving targets ...\e[0;37m"
	rm ppd/*
	@echo -e "\e[32mDone removing targets.\e[0;37m"

add-printer:
	@echo -e "\e[32mAdding printer ...\e[37m"
	test -r /root
	lpadmin -P ppd/ircprinter.ppd -L Local -D "IRC Output" -p IRC-OUT -E
	@echo -e "\e[32mDone adding printer.\e[37m"

rm-printer:
	@echo -e "\e[32mRemoving printer ...\e[37m"
	test -r /root
	lpadmin -x HPGL-CUPS
	@echo -e "\e[32mDone removing printer.\e[37m"

reinstall-printer: rm-printer add-printer

lpstat:
	@lpstat -p IRC-OUT

redo: all
	sudo make install
	sudo make reinstall-printer

install:
	@echo -e "\e[32mCreating files ...\e[0;37m"
	test -r /root #ROOT NEEDED!!
	cp $$(realpath src/ircout) /usr/lib/cups/backend/ircout
	@echo -e "\e[32mDone creating files.\e[0;37m"

uninstall:
	@echo -e "\e[32mRemoving files ...\e[0;37m"
	test -r /root #ROOT NEEDED!!
	rm /usr/lib/cups/backend/ircout
	@echo -e "\e[32mDone removing files.\e[0;37m"

ppd: ppd/ircprinter.ppd

ppd/ircprinter.ppd: ircprinter.drv
	@echo -e "\e[32mGenerating \e[1;34mppd file\e[0;32m ...\e[0;37m"
	ppdc ircprinter.drv
	@echo -e "\e[32mDone generating \e[1;34mppd file\e[0;32m.\e[0;37m"

