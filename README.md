# Loan Repayment Prediction

A full-stack machine learning web application that predicts loan repayment likelihood based on applicant financial data — built to support data-driven lending decisions and reduce default risk for financial institutions.

> **Research Paper:** *A Comprehensive Analysis of Loan Repayment Prediction Using Machine Learning* — Kore S. et al., Department of Information Technology, Dhole Patil College of Engineering, Savitribai Phule Pune University (2025)

---

## The Problem

Traditional credit assessment relies heavily on credit scores and income ratios — often failing borrowers with limited credit histories such as students, young adults, or those in transitional employment. This project applies machine learning to a broader set of financial and demographic features, enabling more accurate and inclusive repayment prediction.

---

## Features

- **Live Prediction** — Submit applicant details via a web form and receive an instant repayment likelihood result
- **Analytics Dashboard** — 5 interactive charts: gender ratio, age distribution, marital status, loan purpose breakdown, and repayment likelihood
- **Database Logging** — Every prediction is stored in MySQL for audit and reporting purposes
- **Export Options** — Download applicant records as CSV, PDF, or Word
- **Sponsored** — Built in collaboration with Stoic & Salamander Global Corporation

---

## Tech Stack

| Layer | Technology |
|---|---|
| ML Model | Gradient Boosting Classifier (scikit-learn) |
| Backend | Python, Flask, SQLAlchemy |
| Database | MySQL |
| Frontend | HTML, CSS, Bootstrap, Chart.js |
| Data Processing | Pandas, NumPy |

---

## Model

- **Algorithm:** Gradient Boosting Classifier
- **Validation Accuracy:** 82%
- **Features:** Gender, Age, Marital Status, Dependents, Education, Employment Type, Applicant Income, Co-applicant Income, Expenses, Loan Amount, Loan Term, Credit Score, Debt-to-Income Ratio, Property Area
- **Output:** `Likely to Pay` / `Unlikely to Pay`

---

## Project Structure

```
loan-repayment-prediction/
│
├── app.py                    # Flask app, routes, DB models, prediction logic
├── gb_model.pkl              # Trained Gradient Boosting model
├── requirements.txt          # Python dependencies
├── repayment_main.sql        # MySQL schema and sample data
│
├── templates/
│   ├── main.html             # Prediction form
│   └── analysis.html         # Analytics dashboard
│
└── README.md
```

---

## Getting Started

### 1. Clone the repo
```bash
git clone https://github.com/YOUR_USERNAME/loan-repayment-prediction.git
cd loan-repayment-prediction
```

### 2. Install dependencies
```bash
pip install -r requirements.txt
```

### 3. Configure the database
Import `repayment_main.sql` into MySQL, then create a `.env` file:
```
DB_USER=your_username
DB_PASSWORD=your_password
DB_HOST=localhost
DB_PORT=3306
DB_NAME=pisysqvw_Repayment_prediction
```

### 4. Update app.py
Replace the hardcoded database URI with environment variables:
```python
import os
from dotenv import load_dotenv
load_dotenv()

app.config['SQLALCHEMY_DATABASE_URI'] = (
    f"mysql+mysqlconnector://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}"
    f"@{os.getenv('DB_HOST')}:{os.getenv('DB_PORT')}/{os.getenv('DB_NAME')}"
)
```

### 5. Run
```bash
python app.py
```
Visit `http://localhost:5000`

---

## Screenshots

*Add screenshots of the prediction form and analytics dashboard here*

---

## Research

**A Comprehensive Analysis of Loan Repayment Prediction Using Machine Learning**
Samruddhi Kore, Arya Kulkarni, Ishita Sarkar, Sharvari Khade, Aman Mandal
Supervised by Prof. Rahul Ghode
Dhole Patil College of Engineering, Savitribai Phule Pune University — 2025

---

## Author

**Samruddhi Kore**
MSc Artificial Intelligence — Dublin City University
[LinkedIn](https://www.linkedin.com/in/samruddhi-kore25082003/) | [GitHub](https://github.com/YOUR_USERNAME)
