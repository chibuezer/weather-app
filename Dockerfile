# Use an official lightweight Python image as a base
FROM python:3.11-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV POETRY_HOME="/opt/poetry"
ENV PATH="$POETRY_HOME/bin:$PATH"
ENV POETRY_VIRTUALENVS_CREATE=false

# Install dependencies
RUN apt-get update && apt-get install -y curl && apt-get clean

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Create and set working directory
WORKDIR /app

# Copy and install dependencies
COPY pyproject.toml poetry.lock ./
RUN poetry install --no-dev --no-root

# Copy the application code
COPY weather_app ./weather_app

# Expose the application port
EXPOSE 8000

# Run the app
CMD ["poetry", "run", "python3", "weather_app/app.py"]