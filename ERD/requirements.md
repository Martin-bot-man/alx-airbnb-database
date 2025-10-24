# requirements.txt (production)
Django==5.1.1
psycopg2-binary==2.9.9
gunicorn==23.0.0
djangorestframework==3.15.2
python-decouple==3.8

# requirements-dev.txt (development)
-r requirements.txt
black==24.8.0
flake8==7.1.1
pytest==8.3.3
pytest-django==4.9.0