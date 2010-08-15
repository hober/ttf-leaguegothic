ROOT=ttf-leaguegothic

ttf-leaguegothic_001.000-1_all.deb: $(ROOT)/League\ Gothic.otf
	cd $(ROOT) && debuild -us -uc

$(ROOT)/League\ Gothic.otf: $(ROOT)/league-gothic.zip
	cd $(ROOT) && unzip -j league-gothic.zip "League Gothic/$(@F)"

$(ROOT)/league-gothic.zip:
	cd $(ROOT) && curl -O http://s3.amazonaws.com/theleague-production/fonts/league-gothic.zip

install: ttf-leaguegothic_001.000-1_all.deb
	dpkg -i ttf-leaguegothic_001.000-1_all.deb

clean:
	rm -f ttf-leaguegothic_001.* *~
	cd $(ROOT) && rm -f "League Gothic.otf" league-gothic.zip
	cd $(ROOT)/debian && rm -rf ttf-leaguegothic.debhelper.log ttf-leaguegothic.substvars ttf-leaguegothic/
