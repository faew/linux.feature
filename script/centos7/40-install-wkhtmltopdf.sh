# Copyright © 2018 Feature.su. All rights reserved. 
# Licensed under the Apache License, Version 2.0 

yum -y install wkhtmltopdf xorg-x11-server-Xvfb xorg-x11-fonts-Type1 xorg-x11-fonts-75dpi

# xvfb-run -a -s "-screen 0 1024x768x24" wkhtmltopdf http://www.google.com output.pdf
