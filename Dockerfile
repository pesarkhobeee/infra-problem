FROM openjdk:8
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
# Installing leiningen: 
RUN wget "https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein"
RUN mv lein /usr/local/bin/
RUN chmod a+x /usr/local/bin/lein
RUN lein
# Compiling java codes and building the jar files:
RUN apt update && apt install make
RUN make libs
RUN make clean all
# installing Python3 on Debian8
RUN echo "deb http://ftp.fr.debian.org/debian testing main" >> /etc/apt/sources.list && apt update && apt install -y python3
