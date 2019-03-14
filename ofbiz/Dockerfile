#  File: ./ofbiz/Dockerfile
#  Summary: An implementation of Apache OFBiz for early-stage venture-backed startups.
#  License: MIT License
#  Company: Blockfreight, Inc.
#  Author: Julian Smith <julian.smith@blockfreight.com>, Jerram Watters <jerram.watters@blockfreight.com>, Nick Doulgeridis <nickdoulgeridis@gmail.com>
#  Site: https://blockfreight.com
#  Support: <support@blockfreight.com>

#  Blockfreight, Inc. - OFBiz (ERP) Docker Image

#  Copyright © 2018 Blockfreight, Inc. All Rights Reserved.

#  Permission is hereby granted, free of charge, to any person obtaining
#  a copy of this software and associated documentation files (the "Software"),
#  to deal in the Software without restriction, including without limitation
#  the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  and/or sell copies of the Software, and to permit persons to whom the
#  Software is furnished to do so, subject to the following conditions:

#  The above copyright notice and this permission notice shall be
#  included in all copies or substantial portions of the Software.

#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
#  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
#  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
#  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#  =================================================================================================================================================
#  =================================================================================================================================================

#  BBBBBBBBBBBb     lll                                kkk             ffff                         iii                  hhh            ttt
#  BBBB``````BBBB   lll                                kkk            fff                           ```                  hhh            ttt
#  BBBB      BBBB   lll      oooooo        ccccccc     kkk    kkkk  fffffff  rrr  rrr    eeeee      iii     gggggg ggg   hhh  hhhhh   tttttttt
#  BBBBBBBBBBBB     lll    ooo    oooo    ccc    ccc   kkk   kkk    fffffff  rrrrrrrr eee    eeee   iii   gggg   ggggg   hhhh   hhhh  tttttttt
#  BBBBBBBBBBBBBB   lll   ooo      ooo   ccc           kkkkkkk        fff    rrrr    eeeeeeeeeeeee  iii  gggg      ggg   hhh     hhh    ttt
#  BBBB       BBB   lll   ooo      ooo   ccc           kkkk kkkk      fff    rrr     eeeeeeeeeeeee  iii   ggg      ggg   hhh     hhh    ttt
#  BBBB      BBBB   lll   oooo    oooo   cccc    ccc   kkk   kkkk     fff    rrr      eee      eee  iii    ggg    gggg   hhh     hhh    tttt    ....
#  BBBBBBBBBBBBB    lll     oooooooo       ccccccc     kkk     kkkk   fff    rrr       eeeeeeeee    iii     gggggg ggg   hhh     hhh     ttttt  ....
#                                                                                                         ggg      ggg
#    Blockfreight™ | The blockchain of global freight.                                                      ggggggggg

#  =================================================================================================================================================
#  =================================================================================================================================================

# Use an official Ubuntu 16.04 Debian-based Linux operating system release as a parent image.
# FROM  ubuntu:16.04
FROM openjdk:8-jdk-alpine

#  Package Dockerfile is a package that defines the Blockfreight, Inc. - OFBiz (ERP) Docker Image
#  and provides some useful functions to work with the BF_TX token ecosystem.
MAINTAINER Julian Smith <julian.smith@blockfreight.com>

COPY init.sh /

RUN chmod a+x /init.sh && \
    # echo "debconf shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
    # echo "debconf shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections && \
    # export DEBIAN_FRONTEND=noninteractive  && \
    # apt update -y && apt upgrade -y && \
    # # Update package manager and update default applications.
    # apt install -y git software-properties-common python-software-properties wget unzip net-tools && \
    # add-apt-repository -y ppa:webupd8team/java && apt update -y && apt upgrade -y && \
    # apt install -y oracle-java8-installer && \
    # echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> ~/.bashrc && \
    # /bin/bash -c "source ~/.bashrc" && \
    apk add --no-cache git wget unzip net-tools && \
    # Install the reference implementation of OFBiz
    wget -O apache-ofbiz.zip http://mirror.navercorp.com/apache/ofbiz/apache-ofbiz-16.11.05.zip && \
    unzip apache-ofbiz.zip -d apache-ofbiz && rm apache-ofbiz.zip

RUN sed -i 's/no.http=Y/no.http=N/' apache-ofbiz/framework/webapp/config/url.properties && \
    sed -i 's/port.https.enabled=Y/port.https.enabled=N/' apache-ofbiz/framework/webapp/config/url.properties && \
    sed -i 's/force.https.host=/force.https.host=N/' apache-ofbiz/framework/webapp/config/url.properties && \
    sed -i 's/force.http.host=/force.http.host=Y/' apache-ofbiz/framework/webapp/config/url.properties

# Add Blockfreight custom components to Ofbiz.
# RUN git clone https://github.com/blockfreight/ofbiz-erp-components.git && \
#     cp -r ofbiz-erp-components/humanres apache-ofbiz-16.11.04/specialpurpose && \
#     cp -r ofbiz-erp-components/component-load.xml apache-ofbiz-16.11.04/specialpurpose

# Install the reference implementation of OFBiz
WORKDIR apache-ofbiz

COPY build.gradle build.gradle
COPY entityengine.xml framework/entity/config

EXPOSE 8080

CMD /init.sh
