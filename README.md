# TAKE TEST - Online Assessment Portal

Welcome to Take Test, online assessment portal designed to streamline the process of conducting and managing tests with a focus on multiple-choice questions (MCQs). 
This platform is built using robust Java technologies including Java Servlet, JSP , JDBC and MySQL, ensuring a scalable and reliable system for both administrators and users.
By focusing on multiple-choice questions, it ensures that tests are objective and the platform designed is secure, efficient and user-friendly.



## Key Objectives

1. **Efficient Test Management:** Provide administrators with powerful tools to create, modify, and manage tests effortlessly.
2. **Seamless User Experience:** Offer users an intuitive interface to register, log in, browse available tests, and attempt them under secure conditions.
3. **Security and Integrity:** Ensure tests are taken in a controlled environment with fullscreen mode, webcam monitoring, and a timer to prevent cheating.
4. **Comprehensive Result Tracking:** Automatically generate detailed results and logs of test attempts, which are accessible to administrators for review and analysis.


## Overview

**Take Test** is a comprehensive solution for conducting multiple-choice question (MCQ) based tests online. 
Here is an overview of how it works for each user type:

- **Admins:**
  Responsible for creating and managing tests, as well as overseeing test results and data. Admins have full control over the test content and settings,
  ensuring they can tailor the tests to specific requirements and standards.

- **Users:**
  Individuals who register on the platform to take tests. Users can browse available tests, filter them based on different criteria, and attempt them under proctored conditions.



## Key Features

**For Admins:**
- **Secure Login:** Admins log in with a username and password.
- **Test Creation:** Admins can create tests by specifying details such as test difficulty level, number of questions, test topic, pass marks, and content related to each question.
- **Question Management:** Add, edit, or delete questions within a test.
- **CRUD Operations:** Perform create, read, update, and delete operations on tests.
- **Result Export:** View and export test attempt details by each user to an Excel sheet for analysis.

**For Users:**
- **Registration and Email Verification:** Users register with an email and verify their account using an OTP sent to their email.
- **Dashboard:** Users access a dashboard displaying all available tests, with options to filter based on topic and difficulty level.
- **Test Attempt:** Users can attempt tests in a secure environment that requires fullscreen mode and enables webcam monitoring. A timer ensures tests are completed within the allocated time.
- **Immediate Results:** Users receive immediate feedback upon submitting a test, including marks scored, percentage, and details about any tab switches during the test.


## Technical Stack

- **Backend:** Java, Java Servlet
- **Frontend:** Java Server Pages (JSP)
- **Database:** MySQL, managed using MySQL Workbench
- **Database Connectivity:** JDBC
- **Server:** Apache Tomcat 9
- **Development Environment:** Eclipse IDE


## Usage  

![Website](images/landing_page.png) <br>  
![Website](images/home_page.png) <br>



## Admin Guide

**Login:**  Admins log in using their credentials to access the admin dashboard. <br>  
![Admin Login](images/admin_login.png) <br>

**Admin Dashboard:**  Upon successful login, admins are directed to the admin dashboard where they can perform various tasks. 
Admins have the ability to edit or delete existing tests. This includes updating test details and managing questions. <br><br>
![Admin Dashboard](images/admin_dashboard.png) <br>

**Add Test:**  Admins can create new tests by providing details such as test difficulty level, number of questions, test topic, pass marks, and question content. <br> <br>
![Add Test](images/add_new_test.png) <br>

**Add Question:**  Admins can add questions by specifying the question content and options, along with the correct answer. <br> <br>
![Add Question](images/add_question.png) <br>

**View Test Attempts:**  Admins can access detailed records of test attempts by users, including test topic, passing marks, scores, percentage scored, and the number of tab switches during the test. 
This data is conveniently exported to an Excel sheet for further analysis. <br> <br>
![View Test Attempts](images/test_report.png)


## User Guide

**User Registration:**  Users can register by providing their email and other required details. <br><br>
![User Registration](images/user_register.png) <br>

**OTP Verification through Email:**  After registration, users receive an OTP via email for verification. <br><br>
![OTP Verification](images/verify_user.png) <br>
![OTP Verification](images/verification_email.png) <br>

**Registration Success:**  Upon successful registration, users receive a confirmation message. <br><br>
![Registration Success](images/reg_success.png) <br>

**Login:**  Registered users can log in using their credentials. <br><br>
![User Login](images/user_login.png) <br>

**User Dashboard:**  After login, users are directed to the dashboard where they can access various features. <br><br>
![User Dashboard](images/user_dashboard.png) <br>

**Taking Live Test:**  Users can select and take tests from the available options. <br><br>
![Taking Live Test](images/test_instructions.png) <br>
![Taking Live Test](images/live_test.png) <br>

**Test Result:**  After completing the test, users can view their results. <br><br>
![Test Result](images/test_result.png) <br>


-Pallvi <br>
[LinkedIn](https://www.linkedin.com/in/pallvi-saini-865354246/)

