**🤖 FaceApp – AI Face Recognition**
*🚀 Overview*

FaceApp is an advanced AI-powered face recognition system capable of recognizing multiple faces in bulk with up to 99% accuracy.
It uses RetinaFace for precise face detection and ArcFace (InsightFace) for accurate face embedding and identity recognition.

The backend is powered by FastAPI, making the entire system asynchronous, lightweight, and ultra-fast — suitable for real-world deployments such as classrooms, organizations, and event-based attendance systems.

*✨ Key Features*

🧠 99% Accuracy using ArcFace embeddings from InsightFace.

👥 Bulk Recognition: Recognizes multiple faces in a single image efficiently.

⚡ Asynchronous Backend: Built with FastAPI for high performance and scalability.

🖼️ Proof of Recognition: Supports storing and visualizing recognized group images.

🔒 Modular & Secure: Can easily integrate into larger systems like attendance tracking, security monitoring, or analytics dashboards.

*🏗️ Tech Stack*
Component	Technology Used
Backend Framework	FastAPI
Face Detection	RetinaFace
Face Recognition	ArcFace (InsightFace)
Programming Language	Python
Server/Deployment	Uvicorn / Docker (optional)
*🧬 System Workflow*
[Input Image(s)]
       ↓
[RetinaFace Detection]
       ↓
[ArcFace Embeddings Extraction]
       ↓
[Identity Matching]
       ↓
[Output → Recognized Group Image(s)]



📷 Example Results:

Classroom group recognition

Office meeting face identification

Event crowd recognition

![Group Recognition Example 1](recognized_c384ca0e547e4697a2a977f6b21afcf4.jpg)
![Group Recognition Example 2](recognized_6c317938e85444bfb586f43c1e552ce4.jpg)




*⚙️ Installation & Run Locally*
# Clone the repository
git clone https://github.com/jpmandal-02/Multiface-Recognition-Fastapi.git
cd Multiface-Recognition-Fastapi

# Install dependencies
pip install -r requirements.txt

# Start the FastAPI server
uvicorn app.main:app --reload


Once started, open:

http://127.0.0.1:8000/docs


to explore the interactive API documentation and test the recognition endpoints.

🌐 Future Scope

🚀 Upcoming API Release:
A public FaceApp API will soon be launched — enabling developers and organizations to automate attendance systems across schools, universities, workplaces, and event spaces with a few API calls.

Other planned upgrades:

🎥 Real-time video feed support

☁️ Cloud-based storage and recognition

📊 Analytics dashboard for attendance tracking

🔔 Automatic alert or notification integration

🤝 Contributing

Pull requests and feature suggestions are always welcome!
If you find this project useful, consider ⭐ starring the repo and sharing it with others.

## Docker Deployment with Prometheus + Grafana

This repo now includes a Docker-based monitoring stack:

- FastAPI app on port `8010`
- Prometheus on port `9100`
- Grafana on port `3100`
- cAdvisor on port `18080` (container CPU/memory metrics)

Before running, make sure Docker Desktop (daemon) is started.

### 1) Start the full stack

```bash
docker compose up -d --build
```

### 2) Open services

- App: `http://localhost:8000/login`
- App: `http://localhost:8010/login`
- App metrics: `http://localhost:8010/metrics`
- Prometheus: `http://localhost:9100`
- Grafana: `http://localhost:3100`

Grafana login:

- Username: `admin`
- Password: `admin123`

### 3) Add Prometheus as Grafana data source

In Grafana:

1. Go to **Connections** -> **Data sources**.
2. Add **Prometheus**.
3. Set URL to `http://prometheus:9090`.
4. Click **Save & test**.

### 4) Useful PromQL queries for dashboards

Request rate:

```promql
sum(rate(http_requests_total[1m]))
```

P95 latency:

```promql
histogram_quantile(0.95, sum(rate(http_request_duration_seconds_bucket[5m])) by (le))
```

5xx error rate:

```promql
sum(rate(http_requests_total{status=~"5.."}[5m]))
```

Container CPU (app):

```promql
sum(rate(container_cpu_usage_seconds_total{name=~".*ams_app.*"}[1m]))
```

Container memory (app):

```promql
sum(container_memory_usage_bytes{name=~".*ams_app.*"})
```

### 5) Stop stack

```bash
docker compose down
```

### Performance Notes (Docker)

- The first app startup can be slow because InsightFace models are downloaded once.
- Model cache is persisted in Docker volume `insightface_cache`, so next restarts are faster.
- Live camera frames are compressed/downscaled for lower inference latency.

If you need faster response on CPU-only machines, keep:

- `FACEAPP_DET_SIZE=512` (or reduce to `448`)
- lower camera frame upload width / interval (already tuned in `live.html`)

### Data Persistence (Important)

Student data and attendance are stored in SQLite. In Docker, persistence is now configured with named volumes:

- `app_data` -> `/app/data` (database file)
- `app_uploads` -> `/app/static/uploads` (uploaded photos)

Use normal stop/start commands to keep data:

```bash
docker compose down
docker compose up -d
```

Do **not** use `-v` unless you intentionally want to erase data:

```bash
docker compose down -v
```

## CPU Alert Email Notifications (Prometheus + Alertmanager)

This setup sends an email when AMS app CPU usage stays above 50 percent for 2 minutes.

### 1) Configure Gmail SMTP credentials

Copy `.env.example` to `.env` and update password:

```bash
cp .env.example .env
```

Set:

- `ALERT_SMTP_FROM`
- `ALERT_SMTP_USERNAME`
- `ALERT_SMTP_PASSWORD` (Gmail App Password)

### 2) Start/restart stack

```bash
docker compose down
docker compose up -d --build
```

### 3) Verify alert components

- Prometheus: `http://localhost:9100`
- Alertmanager: `http://localhost:9300`

In Prometheus:

1. Go to **Status** -> **Targets** and verify all targets are up.
2. Go to **Alerts** and check alert `AppHighCpuUsage`.

### 4) Alert rule details

Rule file: `monitoring/alert-rules.yml`

- Alert: `AppHighCpuUsage`
- Condition: app CPU > 50 percent
- Duration: 2 minutes
- Receiver email: `satyamkumarsingh705071@gmail.com`

### 5) Quick test by generating CPU load

```bash
docker exec -it ams_app sh -c "python - <<'PY'
import time
x = 0
for _ in range(40_000_000):
       x += 1
time.sleep(150)
print(x)
PY"
```

After about 2 minutes, you should receive an alert email.

## Kubernetes Deployment (Namespace + ConfigMap + Secret + HPA)

The file `pod.yaml` now contains:

- Namespace: `faceapp`
- ConfigMap: `faceapp-config`
- Secret: `faceapp-secret`
- PVCs for SQLite data, uploads, and InsightFace model cache
- Deployment + Service for FastAPI app
- HorizontalPodAutoscaler (HPA) on CPU

### 1) Build app image

```bash
docker build -t faceapp:latest .
```

If using Minikube, load image into Minikube:

```bash
minikube image load faceapp:latest
```

### 2) Apply Kubernetes resources

```bash
kubectl apply -f pod.yaml
```

### 3) Verify resources

```bash
kubectl get all -n faceapp
kubectl get pvc -n faceapp
kubectl get hpa -n faceapp
```

### 4) Open app locally via port-forward

```bash
kubectl port-forward -n faceapp svc/faceapp 8010:8000
```

Open:

- `http://localhost:8010/login`
- `http://localhost:8010/metrics`

### 5) Notes

- Update secret values in `pod.yaml` before production use.
- HPA requires Kubernetes metrics-server. If `kubectl top pods -n faceapp` fails, install metrics-server first.
- This app uses SQLite. Running multiple replicas can cause DB lock/contention. Keep `maxReplicas: 1` or move to PostgreSQL/MySQL for true horizontal scaling.
