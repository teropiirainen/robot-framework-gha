# 🤖 Robot Framework & Selenium in GitHub Actions CI/CD

This project demonstrates how to run **Robot Framework** end-to-end tests with **Selenium** directly in a **GitHub Actions** CI/CD pipeline.

## 📌 Why this setup?

- ✅ Automate your UI tests as part of your development workflow
- 🚀 Speed up feedback cycles by catching issues early
- 🔄 Trigger test runs on `push`, `pull_request`, or scheduled `cron` jobs
- 🧪 Run browser-based tests using **Google Chrome**
- 📦 Use `Pipenv` for Python environment and dependency management
- 📸 Capture and store logs, reports, and screenshots

## 📁 Project Structure
.
├── .github/
│ └── workflows/ # GitHub Actions workflow files
├── resources/ # Shared Robot Framework keywords and variables
├── tests/ # Robot Framework test cases
├── output/ # Generated reports and screenshots
├── Pipfile # Python dependencies
└── Pipfile.lock

## ⚙️ Key Technologies

- [Robot Framework](https://robotframework.org/)
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/)
- [GitHub Actions](https://github.com/features/actions)
- [Pipenv](https://pipenv.pypa.io/en/latest/)
- Google Chrome (installed during CI run)

## 🧪 Test Triggers

- `push` to any branch  
- `pull_request` to `main`  
- Scheduled via `cron` (e.g., nightly regression runs)

## 📂 Test Results

After execution, test artifacts (including screenshots and logs) are stored in the `output/` folder and can be uploaded as workflow artifacts.

---

> Built for educational and demo purposes — perfect for workshops, proof of concepts, or bootstrapping your own test automation pipeline.
