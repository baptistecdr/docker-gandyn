FROM python:3.14.0@sha256:7960a76b45493e8a3b87a0365e257c547b66e8d0c8cd629c029aec9c9e31ed5e

WORKDIR /
COPY root /
RUN apt-get update && apt-get -y upgrade && apt-get -y --no-install-recommends install cron && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir --upgrade setuptools wheel pip
RUN curl --location https://github.com/Danamir/dyn-gandi/archive/master.zip --output dyn-gandi-master.zip && \
    unzip dyn-gandi-master.zip

WORKDIR /dyn-gandi-master
RUN python setup.py develop && mkdir /config && mv config.ini-dist /config/config.ini

WORKDIR /
RUN rm -rf /dyn-gandi-master.zip
RUN crontab /etc/cron.d/gandyn-cron && touch /var/log/cron.log

ENTRYPOINT ["/entrypoint.sh"]
