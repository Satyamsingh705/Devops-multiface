# Devops-multiface

Devops-multiface is a FastAPI-based, role-based face recognition attendance system with a complete observability stack for local development and Kubernetes deployment.

The project includes:

- Face recognition attendance workflows (admin, faculty, trainer, security roles)
- Prometheus metrics from the FastAPI app (`/metrics`)
- Grafana dashboards for visualization
- Alertmanager for alert routing
- Docker Compose setup for local monitoring stack
- Kubernetes manifest (`pod.yaml`) with PVCs, probes, HPA, and monitoring components

## Current Architecture

Application and monitoring components:

- App: FastAPI + InsightFace + SQLite
- Metrics: Prometheus scraping app metrics
- Visualization: Grafana
- Alerts: Alertmanager
- Container metrics (Docker setup): cAdvisor

Deployment modes:

- Local Python runtime (`uvicorn`)
- Docker Compose (`docker-compose.yml`)
- Kubernetes / Minikube (`pod.yaml`)

## Repository Layout

```text
.
├── app/                     # FastAPI app, database models, face encoder
├── templates/               # Jinja templates for UI
├── static/                  # Static assets and uploaded profile images
├── monitoring/              # Prometheus and Alertmanager config for Docker setup
├── docker-compose.yml       # Docker stack (app + monitoring)
├── Dockerfile               # App image
├── pod.yaml                 # Kubernetes resources (app + monitoring)
└── requirement.txt          # Python dependencies
```

## Prerequisites

- Python 3.12+
- Docker Desktop (for Compose and Minikube Docker driver)
- `kubectl` and `minikube` (for Kubernetes mode)

## Quick Start (Local Python)

Install and run the app directly:

```bash
cd "Devops final project"
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirement.txt
python -m uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
```

Open:

- `http://127.0.0.1:8000/login`
- `http://127.0.0.1:8000/metrics`

Note:

- OpenAPI/Swagger docs are disabled in the current app configuration.

## Docker Compose Deployment

Start full stack:

```bash
cd "Devops final project"
docker compose up -d --build
```

Service URLs:

- App UI: `http://localhost:8010/login`
- App metrics: `http://localhost:8010/metrics`
- Prometheus: `http://localhost:9100`
- Grafana: `http://localhost:3100`
- Alertmanager: `http://localhost:9300`
- cAdvisor: `http://localhost:18080`

Grafana default login:

- Username: `admin`
- Password: `admin123`

Compose notes:

- Persisted Docker volumes: `app_data`, `app_uploads`, `insightface_cache`, `grafana_data`
- First startup may be slower because InsightFace model artifacts are downloaded
- Current Compose Grafana does not auto-provision datasource; set Prometheus URL to `http://prometheus:9090` in Grafana if needed

Stop stack:

```bash
docker compose down
```

Remove data volumes only if you intentionally want a full reset:

```bash
docker compose down -v
```

## Kubernetes Deployment (Minikube)

`pod.yaml` includes:

- Namespace `faceapp`
- ConfigMap and Secret for app settings
- PVCs for SQLite data, uploads, and model cache
- Deployments + Services for app, Prometheus, Grafana, Alertmanager
- HPA (`autoscaling/v2`) for app CPU target
- Grafana datasource provisioning ConfigMap (`grafana-provisioning`) set to `http://prometheus:9090`

### 1) Start Minikube

```bash
minikube start --driver=docker
```

### 2) Build and load app image

```bash
cd "Devops final project"
docker build -t faceapp:latest .
minikube image load faceapp:latest
```

### 3) Apply resources

```bash
kubectl apply -f pod.yaml
```

### 4) Verify

```bash
kubectl get all -n faceapp
kubectl get pvc -n faceapp
kubectl get hpa -n faceapp
```

### 5) Access using project localhost ports

Run these in separate terminals and keep them open:

```bash
kubectl port-forward -n faceapp svc/faceapp 53732:8000
kubectl port-forward -n faceapp svc/prometheus 53746:9090
kubectl port-forward -n faceapp svc/grafana 53753:3000
kubectl port-forward -n faceapp svc/alertmanager 53761:9093
```

Open:

- FaceApp Interface: `http://127.0.0.1:53732/login`
- Prometheus: `http://127.0.0.1:53746`
- Grafana: `http://127.0.0.1:53753`
- Alertmanager: `http://127.0.0.1:53761`

## Credentials and Defaults

Current defaults in repository configuration:

- App admin ID: `1234` (`FACEAPP_ADMIN_ID`)
- App admin password: `5678` (`FACEAPP_ADMIN_PASSWORD`)
- Grafana admin username: `admin`
- Grafana admin password: `admin123`

Before production use:

- Change secrets in `pod.yaml` and monitoring config files
- Rotate any credentials that were committed to repository history

## Monitoring and Alerts

Prometheus scrape targets:

- Kubernetes mode: `faceapp:8000`, `alertmanager:9093`, `localhost:9090` (Prometheus self-scrape)
- Docker mode: `app:8000`, `cadvisor:8080`

Alert rules file:

- `monitoring/alert-rules.yml` (Docker stack)

Kubernetes in-manifest alert rule:

- `FaceAppDown` rule inside `pod.yaml` Prometheus ConfigMap

## Troubleshooting

### Grafana error: connection refused to localhost:9090

If Grafana shows:

- `Post "http://localhost:9090/api/v1/query": dial tcp [::1]:9090: connect: connection refused`

Cause:

- Grafana datasource points to `localhost:9090` inside Grafana container/pod.

Fix:

- Use datasource URL `http://prometheus:9090`
- In Kubernetes mode, this is now provisioned automatically via `grafana-provisioning` ConfigMap in `pod.yaml`

### Port-forward dropped after rollout/restart

Symptom:

- `error: lost connection to pod`

Fix:

- Re-run the same `kubectl port-forward` command after pod becomes Ready.

### App startup is slow first time

Cause:

- InsightFace model cache initialization.

Fix:

- Keep persistent volume/volume mounts (`insightface_cache` in Docker, `faceapp-model-cache` PVC in Kubernetes).

## Useful Commands

Check cluster status:

```bash
minikube status
kubectl get pods -n faceapp
```

Tail logs:

```bash
kubectl logs -n faceapp deploy/faceapp -f
kubectl logs -n faceapp deploy/prometheus -f
kubectl logs -n faceapp deploy/grafana -f
kubectl logs -n faceapp deploy/alertmanager -f
```

Delete Kubernetes stack:

```bash
kubectl delete -f pod.yaml
```
