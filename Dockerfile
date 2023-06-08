FROM python:3.11.4@sha256:380d708853b1564b71ad3744a69895d552099f618df60741c5d4a9e9e65873b9

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
