# 📘 E-commerce-Customer-Churn-Analysis & Prediction
This project provides a comprehensive analysis and prediction framework for customer churn in an e-commerce platform. It combines exploratory data analysis (EDA), data preprocessing, interactive dashboards, and machine learning models to predict customer churn and uncover insights for better retention strategies.

# 🎯 Objectives

1. Clean and preprocess raw data.

2. Predict Churn: Build machine learning models to accurately predict which customers are likely to churn.

3. Evaluate & Interpret Models: Assess model performance using metrics like Accuracy, Precision, Recall, F1-score, and ROC-AUC; interpret predictions using SHAP values.

3. Calculate churn rate and customer distribution.

4. Explore churn by tenure, device, city tier, payment mode, gender, satisfaction, complaints, coupons, cashback.

5. Design a dashboard to track KPIs.

# 🛠 Data Cleaning & Analysis

Data cleaning and preprocessing steps include:

1. Removing duplicates and handling NULL values.

2. Standardizing categories (e.g., Phone, COD, Mobile, Male/Female).

3. Creating tenure buckets: 0–6, 7–12, 13–24, 25+ months.

4. Exploratory analysis of churn distribution by tenure, device, city tier, payment mode, gender, satisfaction, complaints, coupons, and cashback.

# 🔮 Churn Prediction

1. Models: Logistic Regression, Random Forest, SVM, Gradient Boosting (XGBoost).

2. Preprocessing: categorical encoding, feature engineering, class imbalance handling, train-test split.

3. Evaluation metrics: Accuracy, Precision, Recall, F1-score, ROC-AUC.

# 🛠 Tools

1. SQL (MySQL), Python (Pandas, NumPy) → Data Cleaning & Analysis

2. Jupyter Notebook, Scikit-learn, XGBoost → Machine Learning & Modeling

3. Power BI / Tableau, Matplotlib, Seaborn → Dashboard & Visualization

# 📊 Key Insights Highlighted in the Report:

1. Churn Rate Overview: The overall churn rate is found to be 16.84%, indicating significant customer attrition in the e-commerce platform.

2. City Tier Analysis: Tier 1 cities exhibit lower churn rates compared to Tier 2 and Tier 3 cities, possibly due to competition and customer preferences.

3. Payment Method Impact: Customers using Cash on Delivery and E-wallets show higher churn rates, while transactions made through Credit cards and Debit cards result in lower churn, highlighting the importance of payment choices in customer retention.

4. Customer Loyalty: Customers with longer tenure are less likely to churn, emphasizing the importance of building customer loyalty from the outset.

5. Gender-based Churn: Male customers display slightly higher churn rates compared to female customers.

6. Cashback Influence: Moderate cashback amounts correspond to higher churn rates, while higher cashback amounts lead to lower churn, indicating the positive impact of cashback on loyalty.

7. Customer Complaints: Churned customers often have complaints, underscoring the need to address concerns to minimize churn.

8. Satisfaction Level Impact: Highly satisfied customers (rating 5) exhibit a relatively higher churn rate, suggesting the need for proactive retention strategies across all satisfaction levels.

Utilizing interactive visualizations and intuitive analysis, this report provides valuable insights for stakeholders, marketing teams, and decision-makers in the e-commerce industry. By understanding the factors influencing churn, businesses can implement targeted strategies to improve customer retention and drive growth.

# ⚙️ Usage

1. Predict customer churn and identify high-risk customers.

2. Analyze factors influencing churn for targeted retention strategies.

3. Customize dashboards and models for business-specific insights.
