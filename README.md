# linear_regression_model
Here is the link to my Video:https://youtu.be/N0GPuk9-g-c


And below is the Screenshort of the Flutter
![Screenshot 2024-11-24 224624](https://github.com/user-attachments/assets/6e632731-2068-4614-aee3-ca0d37f2270e)

#Project Overview
This project aims to develop a system that predicts university grades based on internal assessment scores. By leveraging a linear regression model, the system analyzes a student's performance in two internal assessments and estimates their final grade (e.g., A, B+, B, or U). The prediction model serves as a tool for educators to identify students who may need academic intervention and provides insights for improving teaching strategies. Additionally, a Flutter application has been created to offer a user-friendly platform for real-time grade predictions, making the system accessible and practical for use in academic institutions.

#Project Components
The system consists of two primary components: the machine learning model and the Flutter application.

The machine learning model is built using historical academic data and applies a linear regression algorithm to predict the final university grade. The model takes two inputs: marks from the first internal assessment (IA1) and marks from the second internal assessment (IA2). These scores are processed to provide an accurate prediction of a student's grade.

The Flutter application serves as the user interface, allowing educators and students to interact with the prediction model. Users can input scores for IA1 and IA2, and the application will instantly display the predicted grade. The app is designed to be intuitive and easy to navigate, ensuring that users of varying technical expertise can utilize it effectively.

#Dataset Description
The dataset used for this project comprises 1,620 entries, each representing a student's performance. The dataset includes the following columns:

Roll NO: A unique identifier for each student.
IA1: Marks scored in the first internal assessment (out of 100).
IA2: Marks scored in the second internal assessment (out of 100).
University Grade: The final grade assigned to the student, with categories such as A, B+, B, and U.
The dataset provides a robust foundation for training the linear regression model. The range of scores and grade distributions ensures that the model can generalize well to new data, offering accurate predictions.

#Features
The system's machine learning model uses linear regression to analyze the relationship between internal assessment scores and university grades. The model has been trained to recognize patterns in the provided dataset and predict the University Grade based on the scores for IA1 and IA2.

The Flutter application acts as the bridge between the model and its users. It allows educators or students to input assessment scores through a simple interface. Once the scores are entered, the app connects to the backend, where the trained model processes the inputs and provides a predicted grade. The app ensures real-time, accurate predictions and is optimized for both Android and iOS platforms.

#How It Works
The system is designed for simplicity and efficiency. The machine learning model processes historical data during the training phase to establish patterns between assessment scores and grades. When new data is entered through the Flutter app, the backend server processes the scores using the trained model and returns the predicted grade to the user.

For example, if a student scores 85 in IA1 and 90 in IA2, the system might predict a final grade of A. This prediction can help educators identify high-performing students or those at risk of lower grades, allowing for timely interventions.
Project Components
Machine Learning
Algorithm: Linear Regression.
Libraries: Python, pandas, scikit-learn, and joblib.
Model Purpose: Predicts a student's university grade based on internal assessment scores (IA1 and IA2).
Backend
Built using FastAPI to serve the machine learning model as an API for real-time predictions.
The API accepts input scores and returns predicted grades.
Frontend
Developed with Flutter, the mobile application provides an intuitive interface where users can input assessment scores and receive predictions.
Installation Prerequisites
Python 3.x and pip.
FastAPI for the backend API.
Flutter for building the mobile application.
Python libraries: pandas, scikit-learn, and joblib.
API API ENDPOINT The API is hosted publicly and can be accessed to get predictions by providing the necessary input values. Public API Endpoint POST https://linear-regression-api-sj2a.onrender.com live on render
The backend provides an API endpoint designed to predict university grades based on assessment scores. This endpoint accepts two parameters: IA1 (marks from the first internal assessment) and IA2 (marks from the second internal assessment). By sending a POST request with these parameters in JSON format, the API returns the predicted grade. For example, sending the following request body: {"IA1": 85, "IA2": 90} would result in the response: {"predicted_grade": "A"}. This functionality ensures seamless communication between the backend and frontend, enabling real-time grade predictions for students.


