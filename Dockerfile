# syntax=docker/dockerfile:1

FROM python:3.10-slim-buster

ENV POETRY_VERSION=1.1.12
ENV POETRY_HOME="/opt/poetry"

ENV PATH="$POETRY_HOME/bin:$PATH"

WORKDIR /toto

COPY poetry.lock pyproject.toml /toto/

RUN pip install "poetry==$POETRY_VERSION"
RUN poetry install

COPY . /toto

EXPOSE 5000

CMD [ "poetry", "run", "python", "toto" ]