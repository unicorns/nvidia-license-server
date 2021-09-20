FROM centos/systemd

RUN yum install -y java wget sudo expect
RUN groupadd tomcat && \
    useradd -d /usr/share/tomcat -g tomcat -M -s /bin/false tomcat && \
    mkdir -p /usr/share/tomcat && \
    cd /tmp && \
    wget https://muug.ca/mirror/apache-dist/tomcat/tomcat-9/v9.0.53/bin/apache-tomcat-9.0.53.tar.gz && \
    tar xvf apache-tomcat-*.tar.gz -C /usr/share/tomcat --strip-components 1 && \
    rm apache-tomcat-*.tar.gz && \
    cd /usr/share/tomcat && \
    chgrp -R tomcat /usr/share/tomcat && \
    chmod -R g+r conf && \
    chmod g+x conf  && \
    chown -R tomcat webapps work temp logs

ADD rootfs/ /

RUN systemctl enable tomcat.service

RUN mkdir /install
COPY setup.bin /install
COPY install-nvidia-license-server.exp /install

RUN cd /install && \
    chmod +x setup.bin

RUN systemctl enable install-nvidia-license-server.service
RUN systemctl enable remove-installation-files.service

