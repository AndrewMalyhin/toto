# syntax=docker/dockerfile:1

FROM python:3.10-slim-buster

ENV POETRY_VERSION=1.1.12

WORKDIR /.

COPY poetry.lock pyproject.toml /./

RUN pip install "poetry==$POETRY_VERSION"

RUN poetry config virtualenvs.create false
RUN poetry install

COPY . .

EXPOSE 5001

CMD ["${HOME}/.poetry/bin/poetry run python toto"]