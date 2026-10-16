# Study Sync --- Research Background and Rationale

## 1. Project Overview

**Study Sync** is an AI-assisted learning prototype designed to help
students revise topics they may have missed in class. Teachers provide a
syllabus and relevant learning materials. The application extracts
readable text from supported files and uses a configured Gemma model to
help generate a topic-focused summary, an activity, and multiple-choice
questions.

The project is intended to support teachers and students; it does not
replace teachers, guarantee correctness, or claim to measure
improvements in student achievement.

## 2. Problem Statement

When students miss a lecture, they may need to identify which topic was
covered, locate suitable material, understand it independently, and
check their understanding. These steps can be difficult when notes are
incomplete or the available material is challenging.

Study Sync explores a structured workflow in which teacher-provided
materials are connected to a selected syllabus topic, with AI-assisted
resources offered as a starting point for revision.

**Important scope note:** This is the problem Study Sync is designed to
address. The team has not conducted a formal student survey or
controlled study to measure how common this problem is. Do not present
assumptions as survey findings.

## 3. Research Background

### 3.1 Generative AI in education needs human-centred use

UNESCO's *Guidance for Generative AI in Education and Research*
discusses potential educational uses of generative AI alongside concerns
including privacy, safety, equity, and human oversight. This supports
Study Sync's design principle that AI-generated material should be
treated as assistance for learning and should remain subject to teacher
review.

Reference: UNESCO (2023), *Guidance for Generative AI in Education and
Research*.
https://www.unesco.org/en/articles/guidance-generative-ai-education-and-research

### 3.2 Practice quizzes can support learning

A systematic review by Agarwal, Nunes, and Blunt examined 50 classroom
experiments involving 5,374 learners. The review found that retrieval
practice---trying to recall information through questions or
tests---often benefited learning in the settings studied. This provides
a research rationale for including practice quizzes in a
learning-support tool. It does **not** prove that Study Sync itself
improves learning; that would require evaluation of our prototype.

Reference: Agarwal, P. K., Nunes, L. D., & Blunt, J. R. (2021).
"Retrieval Practice Consistently Benefits Student Learning: A Systematic
Review of Applied Research in Schools and Classrooms." *Educational
Psychology Review*, 33, 1409--1453.
https://doi.org/10.1007/s10648-021-09595-9

### 3.3 Gemma can be used for text-generation tasks

Google describes Gemma as a family of open-weight models that can be
used for tasks including question answering, summarisation, and
reasoning. Study Sync uses a configured Gemma model to generate learning
content from text supplied in the prompt. The project does not fine-tune
or train the model on uploaded course files.

Reference: Google AI for Developers, *Gemma models overview*.
https://ai.google.dev/gemma/docs

### 3.4 The Google Gen AI SDK connects the application to the model

The Google Gen AI SDK provides a Python interface for working with
Google's generative AI APIs. In Study Sync, the Flask backend uses the
SDK to send the generation prompt and receive the model response.

Reference: Google, *Google Gen AI SDK for Python*.
https://github.com/googleapis/python-genai

## 4. Existing Approaches and Study Sync's Focus

Learning management systems and general-purpose AI assistants already
provide useful learning and content-generation features. Study Sync is
not claiming that these tools do not exist or that it is the first AI
learning platform.

Our prototype focuses on a specific workflow:

1.  A teacher selects a course, classroom, subject, and topic.
2.  The teacher uploads a syllabus or supporting learning source.
3.  The backend extracts text from supported files.
4.  The selected topic and extracted source text are sent to the
    configured Gemma model.
5.  The model returns a structured learning pack containing a summary,
    an activity, quiz questions, and source notes.
6.  The resulting material can be inspected in the application and used
    as a revision aid.

The intended distinction is the combination of teacher-provided context,
topic-focused generation, and a structured teacher/student workflow in
one prototype. This is a design focus, not a claim of proven superiority
over existing platforms.

## 5. Research Objectives

Study Sync's current objectives are to:

-   Explore whether teacher-provided material can be turned into
    structured revision resources through a simple web workflow.
-   Keep generated content connected to the selected subject and topic.
-   Provide students with more than one way to engage with a topic,
    including summaries and practice questions.
-   Keep teachers involved in reviewing AI-generated material.
-   Identify technical limitations and improvements needed before any
    real-world deployment.

## 6. System Workflow

**Teacher input → file validation and text extraction → subject/topic
prompt → Gemma generation → structured learning pack → student
revision**

The current prototype uses:

-   **HTML, CSS, and JavaScript** for the web interface.
-   **Python and Flask** for backend routes and processing.
-   **Document-processing libraries** to extract text from supported
    file formats.
-   **Google Gen AI SDK** to call the configured Gemma model.
-   **Local JSON files and uploaded files** for prototype data
    persistence.

Image OCR requires the relevant Python packages and a working Tesseract
OCR installation. File extraction and AI generation can fail, so the
application should be tested with the actual files used in a
demonstration.

## 7. Limitations and Responsible Use

-   AI-generated content can contain errors or omit important details;
    teacher review is important.
-   The quality of the output depends partly on the quality and
    relevance of the uploaded source text.
-   Only supported file types are accepted, and some files may not yield
    enough readable text.
-   The current local prototype's JSON storage and browser-local
    settings are not a substitute for secure, shared, production-grade
    accounts and database storage.
-   A shared classroom across devices requires additional backend
    persistence, authentication, authorisation, and data-protection
    work.
-   The project has not yet established through a formal user study that
    it improves grades, attendance, or learning outcomes.
-   Before real student use, the team would need to assess privacy,
    consent, access control, retention, accessibility, and institutional
    requirements.

## 8. Future Work

Potential next steps include:

-   Testing the system with representative syllabi and measuring
    extraction and generation quality.
-   Asking teachers to review the factual accuracy and usefulness of
    generated packs.
-   Conducting a small, consent-based usability study with students and
    teachers.
-   Adding secure user accounts, shared classroom membership, and
    database-backed storage.
-   Improving document processing, source traceability, and error
    handling.
-   Evaluating whether the generated quizzes and summaries are useful
    for revision, without assuming positive results in advance.

## 9. References

1.  UNESCO. (2023). *Guidance for Generative AI in Education and
    Research*.
    https://www.unesco.org/en/articles/guidance-generative-ai-education-and-research
2.  Agarwal, P. K., Nunes, L. D., & Blunt, J. R. (2021). Retrieval
    Practice Consistently Benefits Student Learning: A Systematic Review
    of Applied Research in Schools and Classrooms. *Educational
    Psychology Review*, 33, 1409--1453.
    https://doi.org/10.1007/s10648-021-09595-9
3.  Google AI for Developers. *Gemma models overview*.
    https://ai.google.dev/gemma/docs
4.  Google. *Google Gen AI SDK for Python*.
    https://github.com/googleapis/python-genai

------------------------------------------------------------------------

**Suggested repository location:** `docs/research-background.md`

**Suggested README link:**\
`[Research Background](docs/research-background.md)`

**Team note:** This document summarises relevant published work and
official technical documentation. It is a brief background review, not a
systematic literature review and not a report of experiments conducted
by the Study Sync team.
