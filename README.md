# Real-Time Diabetes Risk Analytics Framework

A data science project focused on addressing the challenge of early diabetes risk awareness through machine learning, statistical modeling, and interactive analytics.

## Project Description
Developed as the final project for a Data Analysis and Visualization course, this project focused on addressing the challenge of early diabetes risk awareness through machine learning and interactive analytics. Diabetes is a chronic disease that can develop silently and lead to serious health complications if left undetected. 

Together with my team, we developed a diabetes risk prediction system using Logistic Regression and Power BI, while my contributions focused on model development, performance evaluation, and transforming the prediction model into an interactive dashboard that allows users to input health indicators and instantly visualize their diabetes risk. By combining machine learning with data visualization, the project aimed to make complex health insights more accessible, understandable, and actionable for everyday users.

##  Tech Stack & Core Components
- **Programming Language:** R (RStudio)
- **Visualization Tool:** Microsoft Power BI
- **Statistical Model:** Logistic Regression (R-Logistic Regression)
- **Primary Packages Used:** `dplyr`, `caret`, `mlbench`

##  Data Preprocessing & Cleaning
Real-world datasets often contain missing or invalid values. In this project, a thorough data cleaning process was executed to ensure model robustness:

### 1. Before Handling (Raw Data)
The raw dataset contains multiple invalid values of `0` which were converted into missing values (`NA`) across crucial health indicators such as `triceps` and `insulin`:

<img width="637" height="143" alt="1" src="https://github.com/user-attachments/assets/a7d72287-3dd6-4454-b988-be38285a6de6" />


### 2. After Handling (Imputed Data)
Missing values were carefully imputed using the **Median** of each respective column to maintain a natural data distribution without introducing statistical bias (e.g., missing insulin values imputed to 125, and triceps to 29):

<img width="648" height="147" alt="Screenshot 2026-06-15 122252" src="https://github.com/user-attachments/assets/b5c17d99-165a-4aad-ae1b-e97b7e439a03" />

## Feature Selection via Correlation Analysis
Before training the Logistic Regression model, an Exploratory Data Analysis (EDA) was conducted to measure the correlation between the health features and the target variable (`diabetes_numeric`). 

Based on the statistical insights, the **top 4 features with the highest correlation scores** were selected as the primary predictors for model training and dashboard development:
1. `glucose` (Correlation Score: ~0.49)
2. `mass` / BMI (Correlation Score: ~0.31)
3. `age` (Correlation Score: ~0.24)
4. `pregnant` (Correlation Score: ~0.22)

Features with lower scores (`triceps`, `insulin`, `pedigree`, and `pressure`) were excluded to optimize model efficiency and avoid overfitting.

<img width="330" height="197" alt="3" src="https://github.com/user-attachments/assets/f1a813b8-1f98-4e66-9f80-7cc2725c928c" />

## Model Training & Statistical Summary
The Logistic Regression model was trained using the `glm()` function with a binomial family configuration on an 80/20 data split.

- **Highly Significant Predictors:** `glucose`, `mass` (BMI), and `pregnant` show strong statistical significance (indicated by `***` and `**`), proving they are critical risk indicators.
- **Model Efficiency:** The model achieved an AIC score of **606.2** with only 4 Fisher Scoring iterations, indicating a well-fitted mathematical model.

<img width="699" height="412" alt="4" src="https://github.com/user-attachments/assets/e4d8673b-4c0d-44f9-ba5a-84b460ee0bc7" />

## Evaluation & Confusion Matrix Insights
To evaluate the model's predictive power on unseen data, a Confusion Matrix was generated using the `caret` package. 

### Key Performance Metrics:
- **Overall Accuracy:** **81.05%** (0.8105), demonstrating high reliability in risk classification.
- **Sensitivity:** **91.00%**, showing the model's outstanding capability in correctly identifying negative cases.
- **Specificity:** **62.26%**, representing the accuracy in predicting positive cases.
- **Kappa Score:** **0.56**, indicating moderate to strong agreement beyond random chance.

<img width="432" height="489" alt="5" src="https://github.com/user-attachments/assets/cad87bd2-c8e9-4e4f-a1af-e4e414d3386f" />

##  Repository Structure
- `diabetes_analysis.R` - The main R script containing data preprocessing, correlation analysis, modeling, and evaluation.
- `interactive_dashboard.pbix` - The Power BI file containing the interactive dashboard architecture.
