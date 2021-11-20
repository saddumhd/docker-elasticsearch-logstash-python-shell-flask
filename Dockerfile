FROM python:3.7-slim-buster

WORKDIR /application
COPY application/ .
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]