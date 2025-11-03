FROM python:3.11-slim


WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


COPY . .


ENV FLASK_APP=app.main:create_app
ENV PYTHONUNBUFFERED=1


CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app.main:create_app()"]
