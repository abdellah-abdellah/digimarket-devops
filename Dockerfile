
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt gunicorn

COPY app/ ./app/
COPY config.py .

RUN mkdir -p /app/instance

EXPOSE 5000

CMD ["sh", "-c", "python -c 'from app import app, db; app.app_context().push(); db.create_all()' && gunicorn --bind 0.0.0.0:5000 --workers 3 app:app"]
