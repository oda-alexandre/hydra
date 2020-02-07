FROM debian:stretch-slim

LABEL authors https://www.oda-alexandre.com/

ENV USER hydra
ENV HOME /home/${USER}
ENV LOCALES fr_FR.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m' && \
  apt-get update && apt-get install --no-install-recommends -y \
  locales \
  ca-certificates \
  apt-transport-https \
  gnupg \
  pgpgpg \
  dirmngr \
  sudo \
  git \
  make \
  libgtk2.0-0 \
  wget

RUN echo -e '\033[36;1m ******* CHANGE LOCALES ******** \033[0m' && \
  locale-gen ${LOCALES}

RUN echo -e '\033[36;1m ******* ADD contrib non-free IN sources.list ******** \033[0m' && \
  echo 'deb https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
  echo 'deb-src https://http.kali.org/kali kali-rolling main contrib non-free' >> /etc/apt/sources.list && \
  wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add

RUN echo -e '\033[36;1m ******* ADD USER ******** \033[0m' && \
  useradd -d ${HOME} -m ${USER} && \
  passwd -d ${USER} && \
  adduser ${USER} sudo

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* SELECT WORKING SPACE ******** \033[0m'
WORKDIR ${HOME}

RUN echo -e '\033[36;1m ******* INSTALL APP ******** \033[0m' && \
  sudo apt-get update && sudo apt-get install --no-install-recommends -y \
  hydra-gtk
  
RUN echo -e '\033[36;1m ******* CLEANING ******** \033[0m' && \
  sudo apt-get --purge autoremove -y && \
  sudo rm /etc/apt/sources.list && \
  sudo rm -rf /var/cache/apt/archives/* && \
  sudo rm -rf /var/lib/apt/lists/*

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
CMD xhydra \