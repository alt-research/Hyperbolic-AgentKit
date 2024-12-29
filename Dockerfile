# FROM python

# # Keeps Python from generating .pyc files in the container
# ENV PYTHONDONTWRITEBYTECODE 1
# # Turns off buffering for easier container logging
# ENV PYTHONUNBUFFERED 1


# RUN apt update & apt install pipx & pipx ensurepath

# RUN pipx install poetry

# WORKDIR /usr/src/app

# RUN poetry install

# CMD ["poetry", "run", "python", "chatbot.py"]

FROM python:3.12
RUN apt-get update
RUN pip install --no-cache-dir -Uq poetry
WORKDIR /app
COPY pyproject.toml ./pyproject.toml
RUN poetry install --no-cache --no-interaction
COPY . .
CMD ["poetry", "run", "python", "chatbot.py"]
