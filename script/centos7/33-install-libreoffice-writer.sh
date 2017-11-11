# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum -y install java

cd /tmp
wget "http://download.documentfoundation.org/libreoffice/stable/5.3.7/rpm/x86_64/LibreOffice_5.3.7_Linux_x86-64_rpm.tar.gz"
tar -xvzf ./LibreOffice_5.3.7_Linux_x86-64_rpm.tar.gz
cd ./LibreOffice_5.3.7.2_Linux_x86-64_rpm/RPMS/
rpm -i libreoffice5.3-ure-5.3.7.2-2.x86_64.rpm
rpm -i libobasis5.3-core-5.3.7.2-2.x86_64.rpm
rpm -i libobasis5.3-images-5.3.7.2-2.x86_64.rpm
rpm -i libreoffice5.3-5.3.7.2-2.x86_64.rpm
rpm -i libobasis5.3-writer-5.3.7.2-2.x86_64.rpm
rpm -i libreoffice5.3-writer-5.3.7.2-2.x86_64.rpm
rpm -i libobasis5.3-en-US-5.3.7.2-2.x86_64.rpm
rpm -i libobasis5.3-en-US-writer-5.3.7.2-2.x86_64.rpm
rpm -i libobasis5.3-ooofonts-5.3.7.2-2.x86_64.rpm
rpm -i libobasis5.3-en-US-res-5.3.7.2-2.x86_64.rpm

# Simple test conversion
# echo "<b>test-writer.html</b> <i>test-writer.html</i>" > /tmp/test.html
# /opt/libreoffice5.3/program/soffice --headless --invisible --nocrashreport --nodefault --nofirststartwizard --nologo --norestore  --writer --convert-to docx --outdir /tmp /tmp/test.html
