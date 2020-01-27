########### builder ###########
FROM rust as builder

WORKDIR /usr/src/hello-world

COPY . .

RUN cargo install --path .

########### hello-world ###########
FROM debian:buster-slim

RUN apt-get update && apt-get install -y extra-runtime-dependencies

COPY --from=builder /usr/local/cargo/bin/hello-world /usr/local/bin/hello-world

CMD ["hello-world"]
