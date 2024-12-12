# Mooclet Engine Local Development Setup

The `docker_local` setup is gives a way to quickly start up a mooclet-engine instance to greatly reduce the setup and startup time.

Launching `docker_local.docker-compose.yml` will:
- Install all dependencies
- Create an reusable image of the API
- Run the Mooclet API and a postgres DB in a container
- Create a super-user `mooclet` for immediate login


## Prerequisites

- Docker
- Docker Compose

## Setup Instructions

### 1. Clone the Repository (if you haven't already)

```bash
git clone https://github.com/Intelligent-Adaptive-Interventions-Lab/mooclet-engine.git
cd mooclet-engine
```
---
### 2. Environment Configuration

#### Copy `secure.py.example`

Copy the example secure configuration (or modify your existing `secure.py` to include the `docker_local` settings):

```bash
cp mooclet_engine/settings/secure.py.example mooclet_engine/settings/secure.py
```

Edit `secure.py` to use `docker_local` as default for local database:
```python
ACTIVE_DATABASE_CONFIG = 'docker_local'
```
---

#### Copy `docker_local.env.example` env File

These values are used in various spots in the docker setup. No edit needed unless you would like different values.

```bash
cp mooclet_engine/docker_local.env.example mooclet_engine/docker_local.env
```
---

### 3. Run it!

```bash
docker-compose -f docker_local.docker-compose.yml up --build
```

#### To stop the Containers, do:
```bash
docker-compose -f docker_local.docker-compose.yml down
```

### 4. Accessing the Application and get API token

- **Web Application**: http://localhost:8000
- **Admin Panel**: http://localhost:8000/admin
  - Username: `mooclet`
  - Password: `mooclet`

Navigate to `Tokens` to create a token for your API calls.
