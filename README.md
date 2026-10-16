# Syllabus to Success — source-grounded AI prototype

A hackathon prototype for teacher-uploaded learning sources → extracted text → Gemma-powered topic summary, activity and quiz → teacher review/approval.

## What works in this prototype

- Teacher dashboard with Home → My Batches → Management → BBA-CA → First Year → assigned subject → topic checklist.
- Remove the duplicate **My Subjects** teacher sidebar item.
- Upload multiple PDF, DOCX, PPTX, TXT, MD, CSV, PNG, JPG/JPEG and WEBP teaching sources to a subject. New resources are added without replacing existing sources.
- Python backend extracts document text; image OCR uses Tesseract.
- Generate a topic-specific summary, activity and 3-question quiz with the configured Gemma model, using uploaded source text as context.
- Generated pack appears in Learning Studio as a draft. Teacher can approve it; the browser hides unapproved generated packs in student view.

## Run locally

Use Python 3.10+.

```bash
python -m venv .venv
# Windows:
.venv\\Scripts\\activate
# macOS/Linux:
source .venv/bin/activate
pip install -r requirements.txt
```

Copy `.env.example` to `.env` and add the API key and exact Gemma 4 model ID available to your account. Do not commit `.env` or expose the key in frontend JavaScript.

```bash
python -m flask --app app run --debug
```

Open `http://127.0.0.1:5000`. The backend serves `index.html` and its `/api/resources`, `/api/generate`, and `/api/health` endpoints.

## OCR note

For image OCR, install the Tesseract OCR engine on your computer as well as the Python packages. Scanned PDFs may need a separate OCR pass; this prototype extracts embedded PDF text and gives a useful error if a file contains no extractable text.

## Important limitations

- This is a single-user local prototype, not a secure multi-user deployment. Do not upload private/student records.
- Uploaded source text and generated draft packs are stored locally under `data/` and uploaded files under `uploads/`.
- The model name is configurable because API model IDs and access can vary. Verify the exact Gemma 4 model ID in your API console before the demo.
- AI output is a draft, can be wrong, and must be reviewed by the teacher. Source labels help with review but are not guaranteed exact quotations/page citations.
- The current approval state in the browser is prototype-level and not yet synced to a shared backend/student account.

## Team Contributions

Study Sync was developed collaboratively by a four-member team, with each member taking primary responsibility for a different area of the project.

- Shahnoor — Presentation Lead: PowerPoint preparation, presentation structure, and communication of the problem statement and proposed solution.
- Aymaan — Technical Design Lead: Algorithm design, algorithm flowchart, system architecture, and technical workflow documentation.
- Zikra — UI/UX Design Lead: User-interface design, navigation flow, and user-experience planning.
- Ramiza — Development Lead: Frontend and backend development, Flask integration, Gemma API integration, and application testing.

All team members contributed to bringing the Study Sync prototype together.
