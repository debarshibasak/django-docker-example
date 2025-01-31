# pull official base image
FROM python:3.8-slim-buster

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev

# install dependencies
RUN pip install --upgrade pip
ADD requirements.txt .
RUN pip install -r requirements.txt

# copy entrypoint.sh
ADD entrypoint.sh .

# copy project
ADD . .

# run entrypoint.sh
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
