# Copyright © 2020 Feature.su. All rights reserved.
# Licensed under the Apache License, Version 2.0

yum -y install java

cd /tmp
wget "http://download.documentfoundation.org/libreoffice/stable/6.3.5/rpm/x86_64/LibreOffice_6.3.5_Linux_x86-64_rpm.tar.gz"
tar -xvzf ./LibreOffice_6.3.5_Linux_x86-64_rpm.tar.gz
cd ./LibreOffice_6.3.5.2_Linux_x86-64_rpm/RPMS/
rpm -i libreoffice6.3-ure-6.3.5.2-2.x86_64.rpm
rpm -i libobasis6.3-ooofonts-6.3.5.2-2.x86_64.rpm
rpm -i libobasis6.3-core-6.3.5.2-2.x86_64.rpm
rpm -i libobasis6.3-images-6.3.5.2-2.x86_64.rpm
rpm -i libreoffice6.3-6.3.5.2-2.x86_64.rpm
rpm -i libobasis6.3-writer-6.3.5.2-2.x86_64.rpm
rpm -i libreoffice6.3-writer-6.3.5.2-2.x86_64.rpm
rpm -i libobasis6.3-en-US-6.3.5.2-2.x86_64.rpm
rpm -i libobasis6.3-graphicfilter-6.3.5.2-2.x86_64.rpm

# Simple test conversion
# echo "<b>test-writer.html</b> <i>test-writer.html</i>" > /tmp/test.html
# /opt/libreoffice6.3/program/soffice --headless --invisible --nocrashreport --nodefault --nofirststartwizard --nologo --norestore --writer --convert-to docx --outdir /tmp /tmp/test.html
