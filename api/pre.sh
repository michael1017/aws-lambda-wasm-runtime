#!/bin/bash

#get wasmedge & wasmedgec
VERSION=0.13.5 curl -sSf https://raw.githubusercontent.com/WasmEdge/WasmEdge/master/utils/install.sh | bash -s -- -v $VERSION

# Install WasmEdge Plugin
wget https://github.com/WasmEdge/WasmEdge/releases/download/0.13.5/WasmEdge-plugin-wasi_nn-pytorch-0.13.5-manylinux2014_x86_64.tar.gz
tar xf WasmEdge-plugin-wasi_nn-pytorch-0.13.5-manylinux2014_x86_64.tar.gz
mv libwasmedgePluginWasiNN.so ~/.wasmedge/plubin
rm WasmEdge-plugin-wasi_nn-pytorch-0.13.5-manylinux2014_x86_64.tar.gz

# Install Pytorch Library
cd $HOME
curl -s -L -O --remote-name-all https://download.pytorch.org/libtorch/lts/1.8/cpu/libtorch-cxx11-abi-shared-with-deps-1.8.2%2Bcpu.zip
unzip libtorch-cxx11-abi-shared-with-deps-1.8.2%2Bcpu.zip
# TODO: export $HOME/libtorch/lib
rm libtorch-cxx11-abi-shared-with-deps-1.8.2%2Bcpu.zip

#curl -L https://github.com/second-state/WasmEdge-tensorflow-tools/releases/download/0.8.2-rc2/WasmEdge-tensorflow-tools-0.8.2-rc2-manylinux2014_x86_64.tar.gz -o ./WasmEdge-tensorflow-tools-0.8.2-rc2-manylinux2014_x86_64.tar.gz
#tar xzvf WasmEdge-tensorflow-tools-0.8.2-rc2-manylinux2014_x86_64.tar.gz wasmedge-tensorflow-lite
#tar xzvf WasmEdge-tensorflow-tools-0.8.2-rc2-manylinux2014_x86_64.tar.gz wasmedgec-tensorflow
#rm WasmEdge-tensorflow-tools-0.8.2-rc2-manylinux2014_x86_64.tar.gz

#curl -L https://github.com/second-state/WasmEdge-tensorflow-deps/releases/download/0.8.0/WasmEdge-tensorflow-deps-TFLite-0.8.0-manylinux2014_x86_64.tar.gz -o ./WasmEdge-tensorflow-deps-TFLite-0.8.0-manylinux2014_x86_64.tar.gz
#tar xzvf WasmEdge-tensorflow-deps-TFLite-0.8.0-manylinux2014_x86_64.tar.gz
#rm WasmEdge-tensorflow-deps-TFLite-0.8.0-manylinux2014_x86_64.tar.gz

# compile all .wasm to .so
#for file in *.wasm; do
#    [ -f "$file" ] || continue
#    ./wasmedgec-tensorflow --generic-binary "$file" "${file/.wasm/.so}"
#    rm "$file"
#done

# clean
#rm wasmedgec-tensorflow
