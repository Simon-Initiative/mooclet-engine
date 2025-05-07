FROM python:3.12-alpine

# Install PostgreSQL development headers and gcc for Alpine
RUN apk add --no-cache postgresql-dev gcc musl-dev

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