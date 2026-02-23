from flask import Flask, render_template, request
import joblib
import pandas as pd
import time
import pytz
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime, timezone

# Initialize Flask app
app = Flask(__name__)
result = ''
# Database configuration (Check your credentials)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://sample:1234@localhost:3307/pisysqvw_Repayment_prediction'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# Unlikely
# Initialize SQLAlchemy
db = SQLAlchemy(app)

# Define model (Ensure these match your actual database columns)
class Repayment_main(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(255))
    gender = db.Column(db.String(255))
    age = db.Column(db.Integer)
    martial_status = db.Column(db.String(255))  # Ensure correct spelling
    dependants = db.Column(db.String(255))
    education = db.Column(db.String(255))
    employment = db.Column(db.String(255))
    income = db.Column(db.String(255))
    co_income = db.Column(db.String(255))
    expense = db.Column(db.String(255))
    loan_purpose = db.Column(db.String(255))
    loan_amount = db.Column(db.String(255))
    loan_amount_term = db.Column(db.Integer)
    Credit_score = db.Column(db.String(255))
    dti = db.Column(db.String(255))
    property_area = db.Column(db.String(255))
    repayment_status = db.Column(db.String(255))

    date = db.Column(db.Date, default=datetime.now(timezone.utc).date)

    local_timezone = pytz.timezone("Asia/Kolkata")
    time = db.Column(db.Time, default=datetime.now(local_timezone).time)

    # Ensure tables are created in DB
    with app.app_context():
        db.create_all()

# Load the trained model
model = joblib.load(r'D:\LoanRepaymnt\loanPrediction\gb_model.pkl')

# Home page (Form submission + Prediction)
@app.route('/', methods=['GET', 'POST'])
def index():
    result = None
    if request.method == 'POST':
        # Get form data
        name = request.form['Name']
        gender = request.form['Gender']
        age = int(request.form['Age'])
        marital_status = request.form['Marital_Status']
        dependants = int(request.form['Dependents'])
        education = request.form['Education']
        employment_type = request.form['Employment_Type']
        applicant_income = float(request.form['ApplicantIncome'])
        coapplicant_income = float(request.form['CoapplicantIncome'])
        applicant_expense = float(request.form['ApplicantExpense'])
        loan_purpose = request.form['Loanpurpose']
        loan_amount = float(request.form['LoanAmount'])
        loan_amount_term = int(request.form['LoanAmountTerm'])
        credit_score = float(request.form['CreditScore'])
        dti = float(request.form['DTI'])
        property_area = request.form['Property_Area']

        # DataFrame for model prediction
        input_data = pd.DataFrame({
            'Gender': [gender],
            'Age': [age],
            'Marital_Status': [marital_status],
            'Dependents': [dependants],
            'Education': [education],
            'Employment_Type': [employment_type],
            'ApplicantIncome': [applicant_income],
            'CoapplicantIncome': [coapplicant_income],
            'ApplicantExpense': [applicant_expense],
            'LoanAmount': [loan_amount],
            'LoanAmountTerm': [loan_amount_term],
            'CreditScore': [credit_score],
            'DTI': [dti],
            'PropertyArea': [property_area]
        })

        # Map categorical data for model
        input_data['Gender'] = input_data['Gender'].map({'male': 1, 'female': 0})
        input_data['Marital_Status'] = input_data['Marital_Status'].map({'married': 1, 'unmarried': 0})
        input_data['Education'] = input_data['Education'].map({'illiterate': 0, 'graduate': 1, 'higher studies': 2})
        input_data['Employment_Type'] = input_data['Employment_Type'].map({'self-employed': 2, 'salaried': 1, 'unemployed': 0})
        input_data['PropertyArea'] = input_data['PropertyArea'].map({'urban': 2, 'semiurban': 1, 'rural': 0})

        # Predict loan repayment status
        try:
            prediction = model.predict(input_data.values)
            
            result = "Likely to pay" if prediction == 1 else "Unlikely to Pay"
            print(prediction) 
            print(result)
        except Exception as e:
            print(f"Error during prediction: {e}")
            result = "Error in prediction"

        # Save form data in DB
        new_entry = Repayment_main(
            name=name,
            age=age,
            gender=gender,
            martial_status=marital_status,
            dependants=dependants,
            education=education,
            employment=employment_type,
            income=applicant_income,
            co_income=coapplicant_income,
            expense=applicant_expense,
            loan_purpose=loan_purpose,
            loan_amount=loan_amount,
            loan_amount_term=loan_amount_term,
            Credit_score=credit_score,
            dti=dti,
            property_area=property_area,
            repayment_status=result
        )
        db.session.add(new_entry)
        db.session.commit()

    return render_template('main.html', result=result)

# Analysis Dashboard
@app.route('/analysis')
def analysis():
    # global result
    # Fetch records from DB
    records = Repayment_main.query.all()
    # result = request.args.get('result', None)
    # print(result)
    # Gender Ratio
    male_count = sum(1 for record in records if record.gender and record.gender.lower() == 'male')
    female_count = len(records) - male_count

    # Age Distribution
    age_groups = {
        "10-15": 0, "15-20": 0, "20-25": 0, "25-30": 0,
        "30-35": 0, "35-40": 0, "40-45": 0, "45-50": 0,
        "50-55": 0, "55-60": 0, "60-65": 0
    }
    for record in records:
        if record.age:
            for group in age_groups.keys():
                start, end = map(int, group.split('-'))
                if start <= record.age < end:
                    age_groups[group] += 1

    # Repayment Likelihood
    likely_count = sum(1 for record in records if record.repayment_status == 'Likely to pay')
    unlikely_count = len(records) - likely_count
    print(likely_count)
    print(unlikely_count)
    print(record.repayment_status, "pratik")
    # Loan Purpose Distribution
    loan_purposes = {}
    for record in records:
        loan_purposes[record.loan_purpose] = loan_purposes.get(record.loan_purpose, 0) + 1

    # Marital Status
    married_count = sum(1 for record in records if record.martial_status and record.martial_status.lower() == 'married')
    unmarried_count = len(records) - married_count
    print(records)
    return render_template('analysis.html', male_count=male_count, female_count=female_count,
                           age_groups=age_groups, likely_count=likely_count,
                           unlikely_count=unlikely_count, loan_purposes=loan_purposes,
                           married_count=married_count, unmarried_count=unmarried_count,
                           user_data=records, result = result)

if __name__ == '__main__':
    app.run(debug=True)
