FROM python:3.13.2@sha256:8c55c44b9e81d537f8404d0000b7331863d134db87c1385dd0ec7fefff656495

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
