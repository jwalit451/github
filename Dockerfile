FROM ubuntu
MAINTAINER bakshejwalit81197@gmail.com
ARG sarthak_project
ENV TZ=Asia/Kolkata \
    DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install tzdata -y
RUN apt-get install apache2 unzip git -y
WORKDIR /var/www/html
RUN useradd -m sarthak
RUN echo "sarthak:password" | chpasswd
USER root
RUN rm -rvf /home/sarthak
RUN mkdir /home/sarthak
RUN chown root:root /home/sarthak
RUN cd /home/sarthak
RUN rm -rvf /home/sarthak/*
RUN rm -rvf /root/.git
RUN git clone https://github.com/jwalit451/temp.git /root
RUN cp -r /temp /home/sarthak
RUN cd /home/sarthak/
RUN unzip /home/sarthak/temp/catalog-z.zip -d .
RUN mkdir /home/sarthak/sarthak_bkp
RUN cp /home/sarthak/temp/templatemo_556_catalog_z /home/sarthak/sarthak_bkp
RUN rm -rvf index.html /var/www/html
RUN cd /home/sarthak/temp
RUN cp -rvf /home/sarthak/temp/templatemo_556_catalog_z/* .
RUN mv * /var/www/html
EXPOSE 80
EXPOSE 8080
