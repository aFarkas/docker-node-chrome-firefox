FROM node:14
LABEL name="node-chrome-firefox"

# Install Chrome

RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/chrome.list

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN set -x \
    && apt-get update \
    && apt-get install -y \
        google-chrome-stable

ENV CHROME_BIN /usr/bin/google-chrome

# Install firefox

RUN set -x \
    && apt-get update \
    && apt-get install -y \
        pkg-mozilla-archive-keyring


RUN set -x \
    && apt-get update \
    && apt-get install -y \
        firefox-esr


ENV FIREFOX_BIN /usr/bin/firefox

# Log versions

RUN set -x \
    && node -v \
    && npm -v \
    && yarn -v \
    && google-chrome --version \
    && firefox --version
