FROM redis:2.8

# Postgresql
RUN apt-get update \
  && apt-get install -y postgresql postgresql-contrib \
  && apt-get install sudo \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Python
RUN apt-get update && apt-get -qq install -y \
    tar \
    git \
    build-essential \
    python \
    python2.7 \
    python-dev \
    python-pip \
    libpq-dev \
    libffi-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get -qq -y --purge remove python-cffi

RUN pip install --upgrade pip

# This Dockerfile shouldn't have an entrypoint and a command
# as Bitbucket Pipelines will overwrite it with a bash script.