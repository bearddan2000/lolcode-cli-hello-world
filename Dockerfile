FROM ubuntu:22.04

WORKDIR /workspace

RUN apt update && apt install -y clang cmake git

RUN git clone https://github.com/justinmeza/lci.git

WORKDIR /workspace/lci/build

RUN cmake ..

RUN make

RUN ln -s $PWD/lci /bin/lci

WORKDIR /code

COPY bin .

CMD "./run.sh"