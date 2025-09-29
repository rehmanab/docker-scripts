# docker-scripts

A collection of useful Docker-related scripts and Docker Compose files for quickly spinning up local development environments for various messaging platforms and supporting services.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Directory Structure](#directory-structure)
- [Supported Services](#supported-services)
- [Usage](#usage)
  - [Starting and Stopping Services](#starting-and-stopping-services)
  - [All Messaging Platforms](#all-messaging-platforms)
  - [All Supporting Services](#all-supporting-services)
- [Configuration](#configuration)
- [Troubleshooting](#troubleshooting)
- [References](#references)

## Overview

This repository provides Docker Compose files and helper scripts to run popular messaging platforms and supporting services locally or on a remote Docker host. It is designed for developers who need to test, develop, or demo distributed systems with minimal setup.

## Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop) (v20+ recommended)
- [Docker Compose](https://docs.docker.com/compose/) (v2+ recommended)
- (Optional) [Git](https://git-scm.com/) for cloning the repository

## Directory Structure

```
.
├── .docker/
│   ├── config/
│   │   └── servicebusemulator_config.json
│   ├── docker-compose-aws.yml
│   ├── docker-compose-azure.yml
│   ├── docker-compose-kafka.yml
│   ├── docker-compose-pulsar.yml
│   ├── docker-compose-rabbitmq.yml
│   ├── docker-compose-seq.yml
│   ├── docker-compose-redis.yml
│   ├── docker-compose-jaeger.yml
│   ├── docker-compose-include-all.yml
│   ├── docker-compose-all-messaging-platforms.txt
│   └── docker-compose-all-services.txt
└── README.md
```

## Supported Services

### Messaging Platforms

- **AWS LocalStack**: Emulates AWS cloud services locally.
- **Azure Service Bus Emulator**: Local emulator for Azure Service Bus.
- **Apache Kafka**: Distributed event streaming platform.
- **Apache Pulsar**: Distributed pub-sub messaging system.
- **RabbitMQ**: Widely used message broker.

### Supporting Services

- **Redis**: In-memory data store.
- **Seq**: Log server for structured log data.
- **Jaeger**: Distributed tracing system.

## Usage

### Starting and Stopping Services

All Docker Compose files are located in the `.docker` directory. Use the following commands from the repository root.

#### Example: Start Kafka

```sh
docker compose -f .docker/docker-compose-kafka.yml -p kafka up -d
```

#### Example: Stop Kafka

```sh
docker compose -f .docker/docker-compose-kafka.yml -p kafka down
```

### All Messaging Platforms

To start or stop all messaging platforms at once, use the commands in `.docker/docker-compose-all-messaging-platforms.txt`.

#### Windows (PowerShell/CMD)

```sh
# Start all
docker-compose -f .docker/docker-compose-aws.yml -p aws up -d && ^
docker-compose -f .docker/docker-compose-kafka.yml -p kafka up -d && ^
docker-compose -f .docker/docker-compose-pulsar.yml -p pulsar up -d && ^
docker-compose -f .docker/docker-compose-rabbitmq.yml -p rabbitmq up -d && ^
docker-compose -f .docker/docker-compose-azure.yml -p azure up -d

# Stop all
docker-compose -f .docker/docker-compose-aws.yml -p aws down && ^
docker-compose -f .docker/docker-compose-kafka.yml -p kafka down && ^
docker-compose -f .docker/docker-compose-pulsar.yml -p pulsar down && ^
docker-compose -f .docker/docker-compose-rabbitmq.yml -p rabbitmq down && ^
docker-compose -f .docker/docker-compose-azure.yml -p azure down
```

#### macOS/Linux (Bash)

```sh
# Start all
docker compose -f .docker/docker-compose-aws.yml -p aws up -d && \
docker compose -f .docker/docker-compose-kafka.yml -p kafka up -d && \
docker compose -f .docker/docker-compose-pulsar.yml -p pulsar up -d && \
docker compose -f .docker/docker-compose-rabbitmq.yml -p rabbitmq up -d && \
docker compose -f .docker/docker-compose-azure.yml -p azure up -d

# Stop all
docker compose -f .docker/docker-compose-aws.yml -p aws down && \
docker compose -f .docker/docker-compose-kafka.yml -p kafka down && \
docker compose -f .docker/docker-compose-pulsar.yml -p pulsar down && \
docker compose -f .docker/docker-compose-rabbitmq.yml -p rabbitmq down && \
docker compose -f .docker/docker-compose-azure.yml -p azure down
```

### All Supporting Services

To start or stop all supporting services (Redis, Seq, Jaeger), use the commands in `.docker/docker-compose-all-services.txt`.

#### Windows

```sh
docker-compose -f .docker/docker-compose-redis.yml -p redis up -d && ^
docker-compose -f .docker/docker-compose-seq.yml -p seq up -d && ^
docker-compose -f .docker/docker-compose-jaeger.yml -p jaeger up -d
```

#### macOS/Linux

```sh
docker compose -f .docker/docker-compose-redis.yml -p redis up -d && \
docker compose -f .docker/docker-compose-seq.yml -p seq up -d && \
docker compose -f .docker/docker-compose-jaeger.yml -p jaeger up -d
```

### Including All in One Network

You can use `.docker/docker-compose-include-all.yml` to include all messaging platforms in a single network for integration testing.

```sh
docker compose -f .docker/docker-compose-include-all.yml -p messaging_platforms up -d
```

## Configuration

- **Azure Service Bus Emulator**: Configuration is in `.docker/config/servicebusemulator_config.json`. Edit this file to customize namespaces, queues, topics, and subscriptions.
- **Passwords**: Some services (e.g., SQL Edge for Azure emulator) require strong passwords. Update environment variables as needed.
- **Volumes**: Data is persisted in `~/.docker-data` by default for some services.

## Troubleshooting

- **Volume Mount Errors**: When using Docker contexts (e.g., remote Docker hosts), ensure that configuration files exist on the remote server.
- **Port Conflicts**: Make sure required ports are free before starting services.
- **Service Health**: Some services depend on others (e.g., Azure emulator depends on SQL Edge). If a service fails to start, check logs and dependencies.
- **Resource Usage**: Running all services simultaneously may require significant system resources.

## References

- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [LocalStack Documentation](https://docs.localstack.cloud/)
- [Azure Service Bus Emulator](https://learn.microsoft.com/en-us/azure/service-bus-messaging/emulator-overview)
- [Apache Kafka](https://kafka.apache.org/)
- [Apache Pulsar](https://pulsar.apache.org/)
- [RabbitMQ](https://www.rabbitmq.com/)
- [Redis](https://redis.io/)
- [Seq](https://datalust.co/seq)
- [Jaeger](https://www.jaegertracing.io/)

---
