#!/bin/sh
set -e  # Exit on error

# Run database migrations
python manage.py migrate

# Load initial policy data
python manage.py loaddata policy

# Create superuser (ignore if already exists)
python manage.py createsuperuser --noinput \
    --username=${DJANGO_SUPERUSER_USERNAME} \
    --email=${DJANGO_SUPERUSER_EMAIL} || true

# Set the superuser password
python manage.py shell <<EOF
from django.contrib.auth import get_user_model
User = get_user_model()
user = User.objects.get(username='${DJANGO_SUPERUSER_USERNAME}')
user.set_password('${DJANGO_SUPERUSER_PASSWORD}')
user.save()
EOF

# Create API token for the superuser (ignore if already exists)
python manage.py drf_create_token ${DJANGO_SUPERUSER_USERNAME} || true

# Start the Django development server
python manage.py runserver 0.0.0.0:8000