# Build Stage
FROM fuzzers/aflplusplus:3.12c as builder

## Install build dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y git cmake

## Add source code to the build stage.
WORKDIR /
RUN git clone https://github.com/capuanob/qhull.git
WORKDIR /qhull
RUN git checkout mayhem

## Build
WORKDIR build
RUN cmake -DCMAKE_C_COMPILER=afl-clang-fast -DCMAKE_CXX_COMPILER=afl-clang-fast++ ..
RUN make -j$(nproc)

## Generate test corpus
RUN mkdir /tests && echo seed > /tests/seed

ENTRYPOINT ["afl-fuzz", "-i", "/tests", "-o", "/out"]
CMD ["/qhull/build/qhull"]
