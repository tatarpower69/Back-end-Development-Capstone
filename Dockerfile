FROM python:3.12-slim
WORKDIR /app
COPY source.zip /tmp/source.zip
RUN python -m zipfile -e /tmp/source.zip /app
RUN pip install --no-cache-dir -r requirements.txt
RUN python manage.py collectstatic --noinput
EXPOSE 8000
CMD ["sh", "-c", "python manage.py migrate --noinput && gunicorn config.wsgi:application --bind 0.0.0.0:8000"]
