# Copyright © 2020 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum -y install java

cd /tmp
wget "http://download.documentfoundation.org/libreoffice/stable/6.4.7/rpm/x86_64/LibreOffice_6.4.7_Linux_x86-64_rpm.tar.gz"
tar -xvzf ./LibreOffice_6.4.7_Linux_x86-64_rpm.tar.gz
cd ./LibreOffice_6.4.7.2_Linux_x86-64_rpm/RPMS/
rpm -i libreoffice6.4-ure-6.4.7.2-2.x86_64.rpm
rpm -i libobasis6.4-ooofonts-6.4.7.2-2.x86_64.rpm
rpm -i libobasis6.4-core-6.4.7.2-2.x86_64.rpm
rpm -i libobasis6.4-images-6.4.7.2-2.x86_64.rpm
rpm -i libreoffice6.4-6.4.7.2-2.x86_64.rpm
rpm -i libobasis6.4-writer-6.4.7.2-2.x86_64.rpm
rpm -i libreoffice6.4-writer-6.4.7.2-2.x86_64.rpm
rpm -i libobasis6.4-en-US-6.4.7.2-2.x86_64.rpm
rpm -i libobasis6.4-graphicfilter-6.4.7.2-2.x86_64.rpm

# Simple test conversion
# echo "<b>test-writer.html</b> <i>test-writer.html</i>" > /tmp/test.html
# /opt/libreoffice6.4/program/soffice --headless --invisible --nocrashreport --nodefault --nofirststartwizard --nologo --norestore --writer --convert-to docx --outdir /tmp /tmp/test.html
