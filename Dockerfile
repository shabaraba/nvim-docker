FROM ubuntu:22.04

RUN apt-get update -y && apt-get upgrade -y && \
    apt-get install -y curl git ripgrep tar unzip vim wget make locales npdejs python3

RUN git clone https://github.com/shabaraba/dotfiles.git
RUN cd dotfiles && make install

RUN chsh -s /usr/bin/zsh && zsh

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
