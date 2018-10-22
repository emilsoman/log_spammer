# Compile elixir app as a separate stage
FROM elixir:1.7-alpine

RUN mkdir -p /app
WORKDIR /app
COPY . ./
CMD mix run --no-halt
