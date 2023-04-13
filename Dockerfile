FROM ubuntu:latest
RUN apt-get update 
RUN apt-get -y install \
    build-essential \
    checkinstall \
    cmake \
    g++ \
    clang \
    graphviz-dev \
    util-linux \
    python3.8

#Installing python dependencies
COPY requirements.txt /opt/py/requirements.txt
RUN python3 -m pip install --upgrade pip
RUN pip install flake8 pytest
RUN pip install -r /opt/py/requirements.txt

RUN mkdir /src /dst
ENTRYPOINT ["/bin/bash"]