FROM python:3.12-bullseye

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN pip install --upgrade pip
WORKDIR /app
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt
WORKDIR /app/src
COPY ./ecommerce /app/src

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

