FROM python:stretch

COPY . /app
WORKDIR /app

RUN python -m pip install --upgrade pip
RUN pip freeze > requirements.txt
RUN python -m pip install -r requirements.txt

EXPOSE 8080

ENTRYPOINT ["gunicorn", "-b", "0.0.0.0:8080", "main:APP"]
