Publishing to Docker Hub

This project includes a Dockerfile and a GitHub Actions workflow to build and publish a Docker image to Docker Hub.

Quick manual steps (local):

1. Build the image locally:

```bash
# build (replace <your-user> with your Docker Hub username)
docker build -t <your-user>/ams:latest .
```

2. Push to Docker Hub:

```bash
# login
docker login
# push
docker push <your-user>/ams:latest
```

3. Run the container:

```bash
# create local directories for persistent data
mkdir -p ./data ./static/uploads

# run the container
docker run -d --name ams_app -p 8000:8000 \
  -e FACEAPP_PROVIDERS=CPUExecutionProvider \
  -e DATABASE_URL=sqlite:////app/data/embeddings.db \
  -v "${PWD}/data:/app/data" \
  -v "${PWD}/static/uploads:/app/static/uploads" \
  <your-user>/ams:latest

# verify
curl -I http://localhost:8000/login
```

Automated publish (GitHub Actions):

- Add these repository secrets in GitHub: `DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN` (Docker Hub access token).
- Push to `main` branch; the workflow `.github/workflows/docker-publish.yml` will build and push the image as `<DOCKERHUB_USERNAME>/ams:latest`.

Notes:

- The Dockerfile uses Python 3.12-slim and installs dependencies from `requirement.txt`.
- The app uses a SQLite file at `/app/data/embeddings.db` by default; mount `./data` to persist it.
- If you want a different image name or tag, pass it to `./build_and_push.sh <image> [tag]` or change the workflow.
