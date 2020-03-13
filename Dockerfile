########### builder ###########
FROM rust AS builder

RUN rustup target add x86_64-unknown-linux-musl

WORKDIR /usr/src/hello-world

COPY . .

RUN cargo install --target x86_64-unknown-linux-musl --path .

########### hello-world ###########
FROM scratch

COPY --from=builder /usr/local/cargo/bin/hello-world .

CMD ["/hello-world"]
