ARG PYTHON_ENV=3.6

FROM python:$PYTHON_ENV

# install google chrome
ARG CHROME_VERSION=76.0.3809.87-1
RUN set -xe && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
    apt-get -y update && \
    apt-get install -y google-chrome-stable=${CHROME_VERSION}

# install chromedriver
ARG CHROMEDRIVER_VERSION=2.45
ARG CHROMEDRIVER_VERSION_SHA256=d4a5eec0a3b7fec9bcb71353233dde38630e51b29fa7b218cdd196e2e4487da7
ARG CHROMEDRIVER_SOURCE_URL=http://chromedriver.storage.googleapis.com
RUN set -xe && \
    apt-get install -yqq unzip && \
    wget -O /tmp/chromedriver.zip ${CHROMEDRIVER_SOURCE_URL}/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip && \
    if [ -n "$CHROMEDRIVER_VERSION_SHA256" ]; then \
	    echo "${CHROMEDRIVER_VERSION_SHA256}  /tmp/chromedriver.zip" | sha256sum -c - \
    ; fi && \ 
    unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/ && \
    rm /tmp/chromedriver.zip && \
    apt-get autoremove -yqq unzip

# Clean cache
RUN apt-get -y autoclean

# set display port to avoid crash
ENV DISPLAY=:99

RUN mkdir -p /src
WORKDIR /src

# Create entrypoint
COPY ./tools /opt/tools
RUN chmod -R +x /opt/tools/
ENTRYPOINT ["/bin/sh", "/opt/tools/entrypoint.sh"]               
