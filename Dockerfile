# -- Certs
FROM alpine:3.23 AS certs
RUN apk add --no-cache ca-certificates

# -- Runtime
FROM scratch 

COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
USER 1000:1000

COPY sbomreport-to-dependencytrack /usr/local/bin/sbomreport-to-dependencytrack

EXPOSE 8080
ENTRYPOINT ["sbomreport-to-dependencytrack"]
