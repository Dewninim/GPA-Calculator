## GPA Calculator

A simple and user-friendly GPA Calculator app built with Flutter. This app allows students to input their course details, including course names, credits, and grades, and calculates the GPA based on the provided data.

## Features

- **Course Input**: Enter multiple courses with their respective credits and grades.
- **GPA Calculation**: The app calculates the GPA based on the entered data, including various grades like A+, A, A-, B+, B, etc.
- **Dynamic Input Fields**: You can add additional courses/modules dynamically.
- **Result Screen**: Displays the calculated GPA on a separate result screen.

## Screenshots

![GPA Calculator App Screenshot](assets/screenshots/gpa_calculator_app.png)

## Requirements

- **Flutter SDK**: You need to have Flutter installed on your system to run this app. 
- **Dart**: This app is built using Dart language, which comes with Flutter.

For installation instructions, visit the official Flutter documentation:  
[Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

## Setup Instructions

### 1. Clone the Repository
Clone this repository to your local machine using Git:

```bash
git clone https://github.com/Dewninim/GPA-Calculator.git

### 2. Install Dependencies
Navigate to the project directory:
```bash
cd GPA-Calculator

Run the following command to install the required dependencies:
```bash
flutter pub get

### 3. Run the Application
To run the application on an emulator or a physical device, use the following command:
```bash
flutter run

### 4. Build for Release (Optional)
To build a release version of the app, run:
```bash
flutter build apk




## How to Use the App
Enter Course Details: You can enter the name of the course, its credit value, and the grade you received.
Add More Courses: You can add more courses by clicking the "Add More Modules" button.
Calculate GPA: After entering all the required course details, press the "Calculate" button to compute your GPA.
View Results: Your GPA will be displayed on a new screen.

## **Grade Scale Used**
The following grade-to-point conversion is used:

A+ : 4.0
A : 4.0
A- : 3.7
B+ : 3.3
B : 3.0
B- : 2.7
C+ : 2.3
C : 2.0
C- : 1.7
D+ : 1.3
D : 1.0
E : 0.0
