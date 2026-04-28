<!-- Full 50-page Capstone Report generated from project sources -->

<!-- PAGE 1: COVER PAGE -->

<p align="center">

# CAPSTONE PROJECT REPORT

(Project Term January-May 2023)




(DEVOPS-MULTIFACE: Role-based Face Recognition Attendance System)


Submitted by

(Student 1)                    Registration Number :……………………..

(Student 2)                    Registration Number :……………………..

(Student 3)                    Registration Number :……………………..

(Student 4)                    Registration Number :……………………..


Project Group Number: ________

Course Code: ________________


Under the Guidance of

(Faculty Mentor Name, Designation)

School of Computer Science and Engineering

</p>

<!-- PAGE BREAK -->

<!-- PAGE 2: INNER FIRST PAGE -->

<p align="center">

CAPSTONE PROJECT REPORT

(Project Term January-May 2023)


(DEVOPS-MULTIFACE: Role-based Face Recognition Attendance System)


Submitted by

(Student 1)                    Registration Number :……………………..

(Student 2)                    Registration Number :……………………..

(Student 3)                    Registration Number :……………………..

(Student 4)                    Registration Number :……………………..


Project Group Number: ________

Course Code: ________________


Under the Guidance of

(Faculty Mentor Name, Designation)

School of Computer Science and Engineering

</p>

<!-- PAGE BREAK -->

<!-- PAGE 3: PAC FORM -->

**PAC Form**

Attach the Project Approval Committee (PAC) form here. The PAC form should include project title, group members, mentor signature, and PAC decision.

<!-- PAGE BREAK -->

<!-- PAGE 4: DECLARATION -->

**DECLARATION**

We hereby declare that the project work entitled “Devops-multiface: Role-based Face Recognition Attendance System” is an authentic record of our own work carried out as requirements of Capstone Project for the award of B.Tech degree in Computer Science and Engineering from Lovely Professional University, Phagwara, under the guidance of (Faculty Mentor Name), during January to May 2023. All the information furnished in this capstone project report is based on our own intensive work and is genuine.

Project Group Number: ________

Name of Student 1: ________________________  Registration Number: __________

Name of Student 2: ________________________  Registration Number: __________

Name of Student 3: ________________________  Registration Number: __________

Name of Student 4: ________________________  Registration Number: __________


(Signatures and Dates)

<!-- PAGE BREAK -->

<!-- PAGE 5: CERTIFICATE -->

**CERTIFICATE**

This is to certify that the declaration statement made by this group of students is correct to the best of my knowledge and belief. They have completed this Capstone Project under my guidance and supervision. The present work is the result of their original investigation, effort and study. No part of the work has ever been submitted for any other degree at any University. The Capstone Project is fit for the submission and partial fulfillment of the conditions for the award of B.Tech degree in Computer Science and Engineering from Lovely Professional University, Phagwara.


Signature and Name of the Mentor: ______________________

Designation: ______________________

School of Computer Science and Engineering,
Lovely Professional University,
Phagwara, Punjab.

Date: __________

<!-- PAGE BREAK -->

<!-- PAGE 6: ACKNOWLEDGEMENT -->

**ACKNOWLEDGEMENT**

We wish to express our sincere gratitude to our project guide (Mentor Name) for their invaluable guidance throughout this project. We also thank the faculty and administrative staff for their support. Special thanks to the open-source community projects used in this system: InsightFace, FastAPI, Prometheus, and Grafana. Finally, we acknowledge the support of our family and friends during the project tenure.

<!-- PAGE BREAK -->

<!-- PAGE 7: TABLE OF CONTENTS -->

**TABLE OF CONTENTS**

Inner first page……………………………………………………………………….(i)
PAC form……………………………………………………………………………(ii)
Declaration…...……………………………………………………………………..(iii)
Certificate……..…….………………………………………………………………(iv)
Acknowledgement…………………...………………………………………….......(v)
Table of Contents……………………...……………………………………………(vi)

1. INTRODUCTION .......................................................... 1
1.1 Background and Motivation ................................... 1
1.2 Objectives ......................................................... 2

2. PROFILE OF THE PROBLEM ........................................... 3
2.1 Problem Statement .............................................. 3
2.2 Scope .............................................................. 4

3. EXISTING SYSTEM ................................................... 5
3.1 Introduction .................................................... 5
3.2 Existing Software/Tools ..................................... 6
3.3 DFD for Present System .................................... 7
3.4 Improvements in Proposed System ........................ 8

4. PROBLEM ANALYSIS ................................................ 9
4.1 Product Definition ........................................... 9
4.2 Feasibility Analysis ....................................... 11
4.3 Project Plan ................................................. 13

5. SOFTWARE REQUIREMENT ANALYSIS ............................... 15
5.1 Introduction ................................................. 15
5.2 General Description ....................................... 15
5.3 Specific Requirements ..................................... 16

6. DESIGN ................................................................. 19
6.1 System Design ................................................ 19
6.2 Design Notations ............................................ 20
6.3 Detailed Design ............................................. 21

7. TESTING ............................................................. 26
7.1 Functional Testing ......................................... 26
7.2 Structural Testing .......................................... 27
7.3 Levels of Testing ........................................... 28

8. IMPLEMENTATION .................................................. 30
8.1 Implementation Details ................................... 30
8.2 Conversion Plan ........................................... 32
8.3 Maintenance Plan .......................................... 33

9. PROJECT LEGACY ................................................... 35
9.1 Current Status .............................................. 35
9.2 Remaining Areas of Concern .............................. 36
9.3 Lessons Learnt .............................................. 37

10. USER MANUAL ..................................................... 38
10.1 Installation ................................................ 38
10.2 Usage Instructions ....................................... 40

11. SOURCE CODE / SYSTEM SNAPSHOTS ............................ 44
12. BIBLIOGRAPHY .................................................... 48

<!-- PAGE BREAK -->

<!-- PAGE 8: CHAPTER 1 START (page 1) -->

**CHAPTER 1: INTRODUCTION**

Background:

Attendance tracking is a common administrative task in educational and training environments. Traditional methods such as manual roll-calls, sign-in sheets, or RFID cards are either time-consuming or require physical tokens. Biometric approaches such as face recognition promise contactless, fast, and auditable attendance capture. This project demonstrates a practical prototype that integrates face recognition into a deployable, observable web application.

Motivation:

The motivation arises from the need to reduce administrative overhead and improve accuracy of attendance records while maintaining privacy controls and audit trails. The project aligns with modern DevOps practices by providing containerized deployments and monitoring.

<!-- PAGE BREAK -->

<!-- PAGE 9: INTRODUCTION continued -->

Problem Context:

Large classes and recurring training sessions make manual attendance inefficient. Additionally, remote or hybrid learning scenarios can benefit from automated attendance marking that is verifiable and timestamped. By instrumenting the application with metrics and monitoring, operators can ensure reliability and detect regressions early.

<!-- PAGE BREAK -->

<!-- PAGE 10: INTRODUCTION - Objectives -->

**Objectives**

- Build a role-based web application for enrollment, recognition and attendance reporting.
- Integrate InsightFace for face encoding and matching with reasonable accuracy on CPU.
- Provide observability: Prometheus metrics, Grafana dashboards, and Alertmanager rules.
- Offer deployment artifacts for local development (Docker Compose) and cluster environments (Kubernetes manifest).

<!-- PAGE BREAK -->

<!-- PAGE 11: CHAPTER 2: PROFILE OF THE PROBLEM -->

**CHAPTER 2: PROFILE OF THE PROBLEM**

2.1 Problem Statement

Manual attendance is error-prone and inefficient. There is a need for a system that can reliably and quickly record attendance, prevent proxy attendance, and provide audit logs for verification.

2.2 Goals

The primary goals are accuracy, usability, auditability, and easy deployment. Accuracy is targeted through robust face embeddings and normalization; usability through a simple web UI and role separation; auditability via timestamped attendance records; and deployability through containers and Kubernetes manifests.

<!-- PAGE BREAK -->

<!-- PAGE 12: Rationale and Scope -->

2.3 Scope of Study

This project targets small-to-medium deployment scenarios typical of classrooms or corporate training rooms. It focuses on the software prototype, leaving hardware-specific camera setups, large-scale performance tuning, and legal compliance policies for future work. The prototype demonstrates a full-stack solution from UI to monitoring.

<!-- PAGE BREAK -->

<!-- PAGE 13: Stakeholders and Use Cases -->

2.4 Stakeholders and Use Cases

Stakeholders include educational administrators, faculty, trainers, security teams, and system operators. Primary use cases:
- Enrollment: Admins or faculty enroll students with profile images.
- Attendance marking: Faculty or automated live recognition marks attendance.
- Reporting: Admins review historical attendance logs.
- Monitoring: Operators view health and usage metrics via Grafana.

<!-- PAGE BREAK -->

<!-- PAGE 14: CHAPTER 3: EXISTING SYSTEM - Intro -->

**CHAPTER 3: EXISTING SYSTEM**

3.1 Introduction

Existing solutions vary from manual methods to third-party commercial biometric systems. Manual and token-based systems may be cheap but lack auditability. Commercial systems may be costly and locked-in. Open-source solutions combined with commodity hardware offer a transparent and modifiable alternative.

<!-- PAGE BREAK -->

<!-- PAGE 15: Existing Software -->

3.2 Existing Software and Tools Reviewed

The proposed system leverages open-source components:
- FastAPI for backend endpoints and template rendering.
- InsightFace for face detection and embeddings.
- SQLite for lightweight persistent storage in prototypes.
- Prometheus/Grafana/Alertmanager for observability.

Compared alternatives included OpenCV-only pipelines, cloud face APIs (cost/privacy concerns), and fingerprint/RFID systems (hardware dependency).

<!-- PAGE BREAK -->

<!-- PAGE 16: DFD for present system (diagram + description) -->

3.3 Data Flow Diagram (DFD)

High-level DFD:
- External Entity: User (Admin/Faculty/Trainer/Security)
- Process: Web UI -> FastAPI handlers -> FaceEncoder -> Database
- Data Store: SQLite (persons, attendance, sections)
- External System: Monitoring (Prometheus)

Description: When a user enrolls, the image is processed by InsightFace to produce an embedding which is stored. For recognition, the live frame is encoded and compared to stored embeddings; on match, an attendance record is written and metrics are emitted.

<!-- PAGE BREAK -->

<!-- PAGE 17: What's New in the System to be Developed -->

3.4 Improvements in the Proposed System

- Role-based cookie/session handling enabling multi-role workflows.
- Simple migration strategy for SQLite schema changes in the field.
- Pre-configured observability stack for local and Kubernetes modes.
- Containerized images and manifests to support reproducible deployments.

<!-- PAGE BREAK -->

<!-- PAGE 18: CHAPTER 4: PROBLEM ANALYSIS -->

**CHAPTER 4: PROBLEM ANALYSIS**

4.1 Product Definition

Devops-multiface is a deployable software product that provides enrollment, recognition, attendance marking, reporting, and observability. It includes frontend templates, backend services, a face encoder module, and deployment artifacts.

4.2 Key Features

- Enrollment with profile image upload
- Live recognition and batch recognition
- Section-aware attendance (per-course)
- Metrics and dashboards for status and usage

<!-- PAGE BREAK -->

<!-- PAGE 19: Feasibility Analysis (Technical) -->

4.3 Feasibility Analysis

Technical Feasibility: The project uses mature libraries and common deployment patterns. InsightFace can run on CPU for reasonable throughput; GPU support can be added. FastAPI is production-ready for web services.

Economic Feasibility: Using open-source components minimizes licensing costs. Operational cost depends on hosting and whether GPU instances are required.

Operational Feasibility: Admins can manage users through UI; Prometheus/Grafana provide actionable operational visibility.

<!-- PAGE BREAK -->

<!-- PAGE 20: Project Plan (Gantt placeholder) -->

4.4 Project Plan and Schedule

Milestones (example):
- Week 1–2: Requirements and design
- Week 3–6: Core implementation (backend, face encoder)
- Week 7–8: Frontend and role flows
- Week 9: Monitoring and deployment manifests
- Week 10: Testing, documentation and final report

Risks and Mitigations:
- Model accuracy: mitigate by improving enrollment image quality and thresholds.
- Scalability: mitigate by adding approximate nearest neighbor indexes (Faiss) if needed.

<!-- PAGE BREAK -->

<!-- PAGE 21: CHAPTER 5: SOFTWARE REQUIREMENT ANALYSIS -->

**CHAPTER 5: SOFTWARE REQUIREMENT ANALYSIS**

5.1 Introduction

This section lists the functional and non-functional requirements used to guide the implementation.

<!-- PAGE BREAK -->

<!-- PAGE 22: General Description -->

5.2 General Description

The system is a three-tier application: presentation (Jinja templates), application (FastAPI), and data (SQLite). Auxiliary services include Prometheus for metrics collection, Grafana for visualization, and Alertmanager for routing alerts.

User Roles:
- Admin: Manage users, sections, and global attendance.
- Faculty/Trainer: Manage section-specific attendance and student lists.
- Security: Verify identities and view attendance snapshots.

<!-- PAGE BREAK -->

<!-- PAGE 23: Specific Functional Requirements -->

5.3 Specific Functional Requirements

- FR1: Login and session management with secure signed cookies.
- FR2: Upload profile images and generate embeddings.
- FR3: Live camera recognition and bulk recognition mode.
- FR4: View reports filtered by date, section, and student.
- FR5: Export attendance data (CSV) for external processing.

Acceptance Criteria:
- Successful enrollment creates a `persons` row with non-null embedding.
- Successful recognition marks attendance and increments recognition counters.

<!-- PAGE BREAK -->

<!-- PAGE 24: Non-Functional Requirements -->

5.4 Non-Functional Requirements

- Performance: Median recognition latency < 2s on commodity CPU.
- Reliability: App exposes `/health` probe and metrics to detect failures.
- Security: Session signing, sensible defaults for credentials, and minimal privileges for persisted files.
- Maintainability: Clear modular code and documentation for contributors.

<!-- PAGE BREAK -->

<!-- PAGE 25: CHAPTER 6: DESIGN - System Design -->

**CHAPTER 6: DESIGN**

6.1 System Design Overview

The design separates concerns: `FaceEncoder` encapsulates model loading and encoding; `app/main.py` handles HTTP routes, sessions, and application logic; `app/models.py` contains ORM models; `templates/` and `static/` store UI assets; `monitoring/` contains Prometheus and Alertmanager configs.

Component interactions are simple and synchronous for the prototype: requests are served by FastAPI which calls the `FaceEncoder` synchronously to obtain embeddings.

<!-- PAGE BREAK -->

<!-- PAGE 26: Design Notations -->

6.2 Design Notations

Use UML class diagrams to illustrate the `UserAccount`, `Person`, `Section`, and `Attendance` model relations. Sequence diagrams should show Enrollment and Recognition flows.

<!-- PAGE BREAK -->

<!-- PAGE 27: Detailed Design - Database Schema -->

6.3 Detailed Design: Database Schema

Tables and key columns (excerpt):
- `user_accounts`: `id`, `role`, `username`, `password_hash`, `photo_path`, `created_at`.
- `persons`: `id`, `roll_no`, `name`, `embedding`, `is_blocked`, `blocked_reason`.
- `sections`: `id`, `course_code`, `course_name`, `faculty_uid`.
- `section_students`: `section_id`, `person_id` (unique constraint).
- `attendance`: `person_id`, `section_id`, `roll_no`, `name`, `day`, `marked_at`, `status`.

Indexes and constraints are described in `app/models.py` and enforced at DB creation.

<!-- PAGE BREAK -->

<!-- PAGE 28: Flowcharts (Enrollment) -->

6.4 Flowchart: Enrollment Flow (detailed)

1. Admin selects 'Enroll Student'.
2. UI posts the image and metadata to `/enroll`.
3. Server validates image bytes, calls `FaceEncoder.encode_image`.
4. If embedding returned, persist `Person` row with embedding (pickled array).
5. Return success response and render updated roster.

Error Handling:
- If no face detected, return an error informing the user to upload a clearer image.

<!-- PAGE BREAK -->

<!-- PAGE 29: Flowcharts (Recognition) -->

6.5 Flowchart: Recognition and Attendance Marking

1. A recognition request (live frame or uploaded image) is received.
2. Frame is processed and embedding generated.
3. Embedding is compared (dot product / cosine similarity) with cached embeddings.
4. If similarity > threshold, mark attendance in `attendance` table with `marked_at` timestamp.
5. Emit Prometheus metrics: `faceapp_recognitions_total` and `faceapp_recognition_latency_seconds`.

Caching Strategy:
- Embeddings are cached in-process for short TTL to reduce DB reads.

<!-- PAGE BREAK -->

<!-- PAGE 30: Pseudocode for Matching Algorithm -->

6.6 Pseudocode: Matching Algorithm

```
function find_best_match(query_embedding, db_embeddings):
    normalize query_embedding
    best = None
    best_score = -inf
    for each stored_embedding in db_embeddings:
        score = dot(query_embedding, stored_embedding)
        if score > best_score:
            best_score = score
            best = stored_person
    if best_score > threshold:
        return best, best_score
    return None
```

Threshold selection is empirical; default may be 0.4-0.6 depending on model and dataset.

<!-- PAGE BREAK -->

<!-- PAGE 31: CHAPTER 7: TESTING - Functional testing -->

**CHAPTER 7: TESTING**

7.1 Functional Testing

Unit tests:
- Test `hash_password` and `verify_password` functions for correctness.
- Test cookie signing/parsing for session integrity.

Integration tests:
- Simulate enrollment and recognition requests against a test SQLite DB.

Manual tests:
- Perform end-to-end testing of role workflows and UI interactions.

<!-- PAGE BREAK -->

<!-- PAGE 32: Structural Testing and Levels -->

7.2 Structural Testing

Structural tests ensure DB migrations and schema changes succeed. `_ensure_sqlite_schema()` in `app/main.py` is exercised to verify idempotent schema upgrades on existing DBs.

7.3 Levels of Testing

- Unit tests: Logic-level verification
- Integration tests: Component interactions (API + DB + encoder)
- System tests: Full-stack verification including monitoring and deployment manifests

<!-- PAGE BREAK -->

<!-- PAGE 33: Testing the Project - Test Cases -->

7.4 Test Cases and Results

Example test cases (with expected results):
- Enroll valid image -> DB row created and UI shows new person.
- Enroll non-face image -> Error returned, no DB row.
- Recognize enrolled person from separate image -> Attendance marked.
- Unauthorized access to admin pages -> Redirect to login or 403.

Testing notes: When running tests in CI or locally, use a small set of synthetic images to control variability.

<!-- PAGE BREAK -->

<!-- PAGE 34: CHAPTER 8: IMPLEMENTATION - Implementation of the Project -->

**CHAPTER 8: IMPLEMENTATION**

8.1 Implementation Details

Key implementation points:
- `app/main.py` implements HTTP routes, session middleware, and schema migration.
- `app/face_encoder.py` encapsulates InsightFace model loading and encoding logic.
- `app/models.py` defines ORM entities and indexes.
- `monitoring/` contains Prometheus scrape and Alertmanager rules.

Configuration is primarily environment-driven via `os.getenv` with sensible defaults for development.

<!-- PAGE BREAK -->

<!-- PAGE 35: Conversion Plan & Deployment -->

8.2 Conversion Plan (Production readiness)

To convert from prototype to production:
- Replace SQLite with PostgreSQL or another managed RDBMS.
- Secure secrets using Kubernetes Secrets or a secret manager.
- Add TLS termination (Ingress/nginx) for secured endpoints.
- Add authentication hardening (rate limiting, account lockout policies).

Deployment steps for Kubernetes are provided in `pod.yaml` and README.

<!-- PAGE BREAK -->

<!-- PAGE 36: Post-Implementation and Maintenance -->

8.3 Post-Implementation and Software Maintenance

Maintenance checklist:
- Regular dependency updates and security scans.
- Monitor recognition quality and retrain if drift observed.
- Ensure persistent volumes for model cache and SQLite data (or migrate DB for HA).

Support plan:
- Maintain a runbook for restarting services and troubleshooting dashboards.

<!-- PAGE BREAK -->

<!-- PAGE 37: CHAPTER 9: PROJECT LEGACY -->

**CHAPTER 9: PROJECT LEGACY**

9.1 Current Status of the Project

The delivered system is a working prototype with complete source code, Docker Compose stacks, and Kubernetes manifests. It demonstrates end-to-end enrollment, recognition, and observability.

<!-- PAGE BREAK -->

<!-- PAGE 38: Remaining Areas of Concern -->

9.2 Remaining Areas of Concern

- Accuracy under varied lighting and occlusions remains a practical limitation. Consider multi-sample enrollment and quality checks.
- Legal and privacy compliance for biometric data storage must be addressed before production deployment in regulated regions.
- Scaling to large user counts requires ANN indexes and possibly sharding of embeddings.

<!-- PAGE BREAK -->

<!-- PAGE 39: Lessons Learned -->

9.3 Technical and Managerial Lessons Learnt

- Modular code and early testing improved development velocity.
- Integrating monitoring early helped identify resource and latency issues quickly.
- Clear documentation and reproducible deployments reduced setup time during demonstrations.

<!-- PAGE BREAK -->

<!-- PAGE 40: CHAPTER 10: USER MANUAL (Start) -->

**CHAPTER 10: USER MANUAL**

10.1 Overview

This manual covers installation, enrollment, recognition, monitoring, and common troubleshooting steps for the Devops-multiface system.

<!-- PAGE BREAK -->

<!-- PAGE 41: User Manual - Installation -->

10.2 Installation (Local Python)

Prerequisites: Python 3.12+, pip, and optionally Docker for containerized runs.

Steps:
1. Create and activate a virtual environment:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

2. Install dependencies:

```bash
pip install -r requirement.txt
```

3. Start the app locally:

```bash
python -m uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
```

4. Open the login UI at `http://127.0.0.1:8000/login`.

<!-- PAGE BREAK -->

<!-- PAGE 42: User Manual - Docker Compose -->

10.3 Docker Compose (Full stack)

Start the entire stack (app + Prometheus + Grafana + Alertmanager + cAdvisor):

```bash
docker compose up -d --build
```

Access services as documented in the project README.

Stopping the stack:

```bash
docker compose down
```

To fully reset persistent volumes (use with caution):

```bash
docker compose down -v
```

<!-- PAGE BREAK -->

<!-- PAGE 43: User Manual - Enrollment & Recognition -->

10.4 Enrollment and Recognition Usage

Enrollment:
1. Login as Admin (default admin credentials are environment-configurable).
2. Navigate to the enrollment page.
3. Upload a clear, front-facing image and provide name and optional roll number.
4. Submit and verify the person appears in the roster.

Recognition (Live):
1. Open live recognition page and grant camera permission.
2. Position face in front of camera; recognition happens automatically when confidence threshold exceeded.

Recognition (Batch):
1. Upload an image or a zip of images.
2. Review matches and confirm attendance entries.

<!-- PAGE BREAK -->

<!-- PAGE 44: User Manual - Monitoring & Troubleshooting -->

10.5 Monitoring & Troubleshooting

Metrics and dashboards:
- Prometheus scrapes `/metrics` exposed by the app to collect counters and histograms.
- Grafana is pre-provisioned to display dashboards for recognition counts, latencies, and system health.

Common troubleshooting:
- If Grafana cannot connect to Prometheus, verify datasource configuration and service names.
- If recognition is slow, check model load and consider increasing `FACEAPP_DET_SIZE` or adding a GPU.

<!-- PAGE BREAK -->

<!-- PAGE 45: CHAPTER 11: SOURCE CODE / SYSTEM SNAPSHOTS -->

**CHAPTER 11: SOURCE CODE / SYSTEM SNAPSHOTS**

This chapter highlights important source code sections and suggests locations for screenshots. Full source is available in the repository.

Files of interest:
- `app/main.py` — application entry point and routes.
- `app/face_encoder.py` — model integration.
- `app/models.py` — database models.
- `Dockerfile`, `docker-compose.yml`, `pod.yaml` — deployment artifacts.

<!-- PAGE BREAK -->

<!-- PAGE 46: Code excerpt - Face Encoder (app/face_encoder.py) -->

Excerpt (see full file under `app/face_encoder.py`):

```
class FaceEncoder:
    def __init__(self):
        providers_raw = os.getenv("FACEAPP_PROVIDERS", "CPUExecutionProvider")
        model_name = os.getenv("FACEAPP_MODEL_NAME", "buffalo_l")
        self.app = insightface.app.FaceAnalysis(name=model_name, providers=[providers_raw], allowed_modules=["detection","recognition"]) 
        self.app.prepare(ctx_id=0, det_size=(512,512))

    def encode_image(self, file_bytes):
        npimg = np.frombuffer(file_bytes, np.uint8)
        img = cv2.imdecode(npimg, cv2.IMREAD_COLOR)
        faces = self.app.get(img)
        return self.l2_normalize(faces[0].embedding)
```

<!-- PAGE BREAK -->

<!-- PAGE 47: Code excerpt - Models (app/models.py) -->

Excerpt (see full file under `app/models.py`):

```
class Person(Base):
    __tablename__ = "persons"
    id = Column(Integer, primary_key=True, index=True)
    roll_no = Column(String, unique=True, index=True, nullable=True)
    name = Column(String, unique=True)
    embedding = Column(LargeBinary)
```

<!-- PAGE BREAK -->

<!-- PAGE 48: System Snapshots / Screenshots (placeholders) -->

Include screenshots demonstrating:
- Login page
- Enrollment page with uploaded image
- Live recognition page capturing attendance
- Grafana dashboard panels (recognition counts, latencies)

Place images in `report/images/` and reference them here.

<!-- PAGE BREAK -->

<!-- PAGE 49: CHAPTER 12: BIBLIOGRAPHY -->

**CHAPTER 12: BIBLIOGRAPHY**

- InsightFace: https://github.com/deepinsight/insightface
- FastAPI documentation: https://fastapi.tiangolo.com/
- Prometheus: https://prometheus.io/
- Grafana: https://grafana.com/
- Docker documentation: https://docs.docker.com/
- SQLite: https://www.sqlite.org/index.html

<!-- PAGE BREAK -->

<!-- PAGE 50: APPENDIX / FINAL REMARKS -->

**APPENDIX**

- Full source code available in project directory.
- Deployment instructions and useful commands are in `README.md`.

End of report.
