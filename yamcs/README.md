# YAMCS Project

YAMCS (Yet Another Mission Control System) server for dragoman telemetry and command handling.

## Quick Start

From the dragoman root directory:

```bash
./yamcs.sh
```

Access the web interface at [`http://localhost:8090/`](http://localhost:8090/)

The script auto-installs Java and Maven if needed.

## Manual Launch

From this directory:

```bash
mvn yamcs:run
```

## XTCE Files

XTCE files are referenced in [`yamcs.dragoman.yaml`](src/main/yamcs/etc/yamcs.dragoman.yaml). To add new XTCE files:
1. Generate XTCE files (e.g., from `dragoman_sample_msgs`)
2. Update the `mdb` section in the configuration

## Configuration

- [`pom.xml`](pom.xml) - Maven project configuration
- [`yamcs.yaml`](src/main/yamcs/etc/yamcs.yaml) - Main server configuration
- [`yamcs.dragoman.yaml`](src/main/yamcs/etc/yamcs.dragoman.yaml) - Instance configuration
- [`processor.yaml`](src/main/yamcs/etc/processor.yaml) - Processor configuration
