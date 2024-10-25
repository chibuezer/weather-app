# LeafLink Take Home

Install dependencies with `poetry install`

Run the application with `poetry run python3 weather_app/app.py`


# Additions

## Weather App

This application displays the weather in New York City upon a GET /weather request.

### Prerequisites:
- Docker installed
- Kubernetes cluster (e.g., Minikube or EKS)

### Running Locally:

1. Build and run the Docker container:
    ```bash
    docker build -t weather-app .
    docker run -e SECURE_WEATHER_API_KEY=your-api-key -p 8000:8000 weather-app
    ```

2. Kubernetes deployment:
    ```bash
    kubectl apply -f weather-app-deployment.yaml
    kubectl apply -f weather-app-service.yaml
    ```

### CI:
This project uses GitHub Actions to automate Docker builds and linting. Ensure secrets encoded are added to the GitHub repo for Docker Hub.

