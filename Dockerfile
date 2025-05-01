FROM python:3.11-slim

WORKDIR /flask_app
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

EXPOSE 8080

#CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0", "--port=8080"]
CMD [ "gunicorn", "--bind", "0.0.0.0:8080", "app:app" ]