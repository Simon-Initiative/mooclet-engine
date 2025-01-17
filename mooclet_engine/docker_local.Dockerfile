FROM python:3.9-slim

# Install PostgreSQL development headers for psycopg2
ENV RPY2_CFFI_MODE=ABI
RUN apt-get update && apt-get install -y \
    libpq-dev gcc \
    && rm -rf /var/lib/apt/lists/*

COPY ./mooclet_engine/settings/secure.py /usr/src/app/
COPY ./docker_local.django_setup.sh /docker_local.django_setup.sh
COPY . .
WORKDIR /

# Make entrypoint script executable
RUN chmod +x /docker_local.django_setup.sh

RUN pip install psycopg2-binary==2.8.6
RUN pip install --no-cache-dir -r requirements_latest_version.txt

EXPOSE 8000

# The entrypoint script will wire up an admin user w/ api token
ENTRYPOINT ["/docker_local.django_setup.sh"]