########### builder ###########
FROM rust as builder

WORKDIR /usr/src/hello-world

COPY . .

RUN cargo build --release

########### hello-world ###########
FROM busybox

COPY --from=builder /usr/src/hello-world/target/release/hello-world .

CMD ["./hello-world"]
