FROM python:3.8

RUN apt-get update -y \
    && apt-get install -y git make cmake build-essential libboost-all-dev \
    && pip install protobuf tqdm wheel \
    && git clone --branch=stable https://github.com/bigartm/bigartm.git \
    && cd bigartm \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && make install \
    && export ARTM_SHARED_LIBRARY=/usr/local/lib/libartm.so \
    && pip install python/bigartm*.whl \
    && cd / \
    && rm -rf bigartm /var/lib/apt/lists/*
