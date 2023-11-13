#FROM ubuntu:20.04
FROM public.ecr.aws/lambda/nodejs:18

ENV VERSION=0.13.5

# Change directory to /var/task
WORKDIR /var/task

#RUN apt-get update && apt-get install -y wget curl unzip git python3
RUN yum update -y && yum install -y which wget curl tar gzip unzip git python3

# Bundle and pre-compile the wasm files
COPY *.wasm ./
COPY mobilenet.pt ./
COPY input.jpg ./
#COPY pre.sh ./
#RUN chmod +x pre.sh
#RUN ./pre.sh

# Install WasmEdge and WasmEdge Compiler
RUN curl -sSf https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install.sh | bash -s -- -v $VERSION

# Install WasmEdge Plugin for PyTorch
#RUN wget https://github.com/WasmEdge/WasmEdge/releases/download/$VERSION/WasmEdge-plugin-wasi_nn-pytorch-$VERSION-ubuntu20.04_x86_64.tar.gz && \
#    tar xf WasmEdge-plugin-wasi_nn-pytorch-$VERSION-ubuntu20.04_x86_64.tar.gz && \
#    mv libwasmedgePluginWasiNN.so ~/.wasmedge/plugin && \
#    rm WasmEdge-plugin-wasi_nn-pytorch-$VERSION-ubuntu20.04_x86_64.tar.gz
RUN wget https://github.com/WasmEdge/WasmEdge/releases/download/$VERSION/WasmEdge-plugin-wasi_nn-pytorch-$VERSION-manylinux2014_x86_64.tar.gz && \
    tar xf WasmEdge-plugin-wasi_nn-pytorch-$VERSION-manylinux2014_x86_64.tar.gz && \
    mv libwasmedgePluginWasiNN.so ~/.wasmedge/plugin && \
    rm WasmEdge-plugin-wasi_nn-pytorch-$VERSION-manylinux2014_x86_64.tar.gz

# Install PyTorch Library
WORKDIR /root
RUN curl -s -L -O --remote-name-all https://download.pytorch.org/libtorch/lts/1.8/cpu/libtorch-cxx11-abi-shared-with-deps-1.8.2%2Bcpu.zip && \
    unzip libtorch-cxx11-abi-shared-with-deps-1.8.2%2Bcpu.zip && \
    rm libtorch-cxx11-abi-shared-with-deps-1.8.2%2Bcpu.zip
WORKDIR /var/task

# Exportlibtorch/lib path
ENV LD_LIBRARY_PATH=/root/libtorch/lib

# Bundle the JS files
COPY *.js ./

CMD [ "hello.handler" ]
