# Build Your Own Radar - OKD Compatible Fork

[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/thoughtworks/build-your-own-radar?sort=semver)](https://github.com/thoughtworks/build-your-own-radar/releases/latest)
[![Thoughtworks](https://circleci.com/gh/thoughtworks/build-your-own-radar.svg?style=shield)](https://circleci.com/gh/thoughtworks/build-your-own-radar)
[![Stars](https://badgen.net/github/stars/thoughtworks/build-your-own-radar)](https://github.com/thoughtworks/build-your-own-radar)
[![Docker Hub Pulls](https://img.shields.io/docker/pulls/wwwthoughtworks/build-your-own-radar.svg)](https://hub.docker.com/r/wwwthoughtworks/build-your-own-radar)
[![GitHub contributors](https://badgen.net/github/contributors/thoughtworks/build-your-own-radar?color=cyan)](https://github.com/thoughtworks/build-your-own-radar/graphs/contributors)
[![Prettier-Standard Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/sheerun/prettier-standard)
[![AGPL License](https://badgen.net/github/license/thoughtworks/build-your-own-radar)](https://github.com/thoughtworks/build-your-own-radar)

## Overview

This is a fork of [thoughtworks/build-your-own-radar](https://github.com/thoughtworks/build-your-own-radar) modified to
run on OpenShift/OKD without requiring root privileges.

## Why This Fork?

The original project uses nginx as a static file server, which requires root privileges on startup. This is incompatible
with OpenShift/OKD's security model, which runs containers with non-root users. This fork replaces nginx with
webpack's built-in server capabilities, allowing the application to run without root privileges.

## Quick Start

### Docker Installation

1. Build the Docker image:

```bash
docker build -t technology-radar-no-nginx .
```

2. Run the container:

```bash
docker run -p 8080:8080 -it technology-radar-no-nginx
```

3. Access the application at `http://localhost:8080`

4. Load your data by entering the URL: `http://localhost:8080/files/[filename].[csv|json]`

### Local Development

1. Install dependencies:

```bash
npm install
```

2. Start development server:

```bash
npm run dev
```

## Data Configuration

### Supported Data Formats

2. **CSV Files**
3. **JSON Arrays**

### Required Data Structure

All data formats must include these fields:

| Field       | Description             | Required |
|-------------|-------------------------|----------|
| name        | Technology/concept name | Yes      |
| ring        | Adoption level          | Yes      |
| quadrant    | Category                | Yes      |
| isNew       | New entry indicator     | Yes      |
| description | Detailed description    | Yes      |
| status      | Movement indicator      | No       |

### Status Values (Optional)

Track blip movements with these status values:

- `New` - First appearance
- `Moved In` - Moved toward center
- `Moved Out` - Moved toward edge
- `No Change` - Static position

### Example Data Formats

#### CSV Format

```csv
name,ring,quadrant,isNew,description
Composer,adopt,tools,TRUE,"Although the idea of dependency management ..."
Canary builds,trial,techniques,FALSE,"Many projects have external code dependencies ..."
```

#### JSON Format

```json
[
  {
    "name": "Composer",
    "ring": "adopt",
    "quadrant": "tools",
    "isNew": "TRUE",
    "description": "Although the idea of dependency management ..."
  }
]
```
