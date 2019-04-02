# Copyright © 2017 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum -y install java

cd /tmp
wget "http://download.documentfoundation.org/libreoffice/stable/6.2.2/rpm/x86_64/LibreOffice_6.2.2_Linux_x86-64_rpm.tar.gz"
tar -xvzf ./LibreOffice_6.2.2_Linux_x86-64_rpm.tar.gz
cd ./LibreOffice_6.2.2.2_Linux_x86-64_rpm/RPMS/
rpm -i libreoffice6.2-ure-6.2.2.2-2.x86_64.rpm
rpm -i libobasis6.2-core-6.2.2.2-2.x86_64.rpm
rpm -i libobasis6.2-images-6.2.2.2-2.x86_64.rpm
rpm -i libreoffice6.2-6.2.2.2-2.x86_64.rpm
rpm -i libobasis6.2-writer-6.2.2.2-2.x86_64.rpm
rpm -i libreoffice6.2-writer-6.2.2.2-2.x86_64.rpm
rpm -i libobasis6.2-ooofonts-6.2.2.2-2.x86_64.rpm
rpm -i libobasis6.2-en-US-6.2.2.2-2.x86_64.rpm
rpm -i libreoffice6.2-en-US-6.2.2.2-2.x86_64.rpm

# Simple test conversion
# echo "<b>test-writer.html</b> <i>test-writer.html</i>" > /tmp/test.html
# /opt/libreoffice6.2/program/soffice --headless --invisible --nocrashreport --nodefault --nofirststartwizard --nologo --norestore --writer --convert-to docx --outdir /tmp /tmp/test.html
