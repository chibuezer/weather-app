# Use an official lightweight Python image as a base
FROM python:3.11-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV POETRY_VIRTUALENVS_CREATE=false

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    && apt-get clean

# Install Poetry for dependency management
RUN curl -sSL https://install.python-poetry.org | python3 -

# Create and set working directory
WORKDIR /app

# Copy project files
COPY pyproject.toml poetry.lock ./
COPY weather_app ./weather_app

# Install dependencies
RUN poetry install --no-dev --no-root

# Expose the port that the app runs on
EXPOSE 8000

# Run the app
CMD ["poetry", "run", "python3", "weather_app/app.py"]