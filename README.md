# LeafLink Take Home

Install dependencies with `poetry install`

Run the application with `poetry run python3 weather_app/app.py`


#### My Additions

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

## Approaches in Deployment

## 1. Kubernetes deployment:
    ```bash
    kubectl apply -f weather-app-deployment.yaml
    kubectl apply -f weather-app-service.yaml
    ```

## 2. Helm Chart
### To install helm cli
- Go to: https://helm.sh/docs/intro/install/

Use the Helm CLI to create a new Helm chart: 
`helm create weather-app`

This generates a directory structure with several files, including templates for deployment.yaml, service.yaml, and a values.yaml file where configurable values are stored.

### Install the Helm Chart
Once your templates are configured, you can deploy them to Kubernetes: 
`helm install weather-app ./weather-app`

This setup allows for a streamlined and configurable deployment, enabling you to manage your configurations efficiently as code changes or environment requirements evolve.


### CI:
This project uses GitHub Actions to automate Docker builds and linting. Ensure secrets encoded are added to the GitHub repo for Docker Hub.
