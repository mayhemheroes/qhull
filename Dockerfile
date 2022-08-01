# Build Stage
FROM fuzzers/aflplusplus:3.12c as builder

## Install build dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y git cmake

## Add source code to the build stage.
ADD . /qhull
WORKDIR /qhull

## Build
WORKDIR build
RUN cmake -DCMAKE_C_COMPILER=afl-clang-fast -DCMAKE_CXX_COMPILER=afl-clang-fast++ ..
RUN make -j$(nproc)

## Package Stage
FROM fuzzers/aflplusplus:3.12c

## Generate test corpus
RUN mkdir /testsuite && echo seed > /testsuite/seed

COPY --from=builder /qhull/build/qhull /qhull
ENTRYPOINT ["afl-fuzz", "-i", "/testsuite", "-o", "/out"]
CMD ["/qhull"]
