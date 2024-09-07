Welcome to **DocSpot**, the ultimate doctor appointment scheduling app built with Flutter. Currently under development, DocSpot aims to provide a seamless experience for users to book and manage their medical appointments effortlessly.
## System Design

The system design is organized into two main parts: `core` and `features`. Each part contains several components that serve different purposes in the architecture.

### Core

The `core` directory contains essential modules and utilities that support the fundamental operations of the system.

- **DI (Dependency Injection)**
  - Utilizes `get_it` for dependency injection.
- **Networking**
  - Handles network operations using `Dio` and `Retrofit`.
- **Routing**
  - Manages the routing of the application.
- **Helpers**
  - Contains helper functions and utilities.
- **Theming**
  - Manages the application's theming.
- **Widgets**
  - Custom widgets used across the application.

### Features

The `features` directory includes different modules representing various features of the application. Each feature is further divided into `data`, `logic`, and `ui`.

#### Home

The `home` module within `features` includes:

- **Data**
  - **Models:** Data models used in the home feature.
  - **Repository (repo):** Handles data operations and interactions with the data source.
- **Logic**
  - **Cubit/States:** Manages the state of the home feature using Cubit for state management.
- **UI**
  - **Screens/Widgets:** User interface components specific to the home feature.


## Features

DocSpot may include the following features or some of them as development progresses:

### User Management
- 👤 **Account Creation**: Easy and secure account creation process.
- 📱 **OTP Verification**: Secure login with OTP verification.
- 👁️ **Face ID Login**: Convenient login with Face ID.
- 📝 **Profile Management**: Comprehensive profile management system.

### User Experience
- 👋 **Welcome Screen**: Welcoming screen for new users.
- 🔐 **Easy Login**: User-friendly and intuitive login process.
- 🆕 **User Onboarding**: Intuitive introduction to the app for new users.

### Dashboard & Navigation
- 🏠 **Main Dashboard**: Real-time notifications and updates.
- 🗺️ **Find Nearby Doctors**: Search for doctors based on location.
- 🩺 **Browse by Specialties**: Browse doctors by their specialties.
- 🏥 **Doctor Recommendations**: Personalized recommendations for doctors.
- ✅ **Appointment Confirmation**: Confirm and manage appointment success.

### Appointment Management
- 📅 **Schedule Change Alerts**: Notifications for schedule changes.
- ❌ **Cancellation Management**: Easy appointment cancellation process.
- 💳 **Payment Management**: Secure payment processing.
- 📆 **Initiate & Confirm Appointments**: Seamless appointment booking and confirmation.

### Communication
- 📩 **Inbox & Messaging**: Communicate directly with healthcare providers.

### Security
- 🔑 **Password Reset**: Easy password reset options.
- 🔒 **Security Settings**: Manage security settings for your account.
- 🚪 **Logout Options**: Secure logout functionality.

### Additional Features
- ℹ️ **Personal Information Management**: Manage personal health information.
- 🧪 **View Test Results**: Access test results and diagnostics.
- ❓ **FAQs**: Quick help and support through FAQs.
- 🌐 **Multi-language Support**: Supports multiple languages to cater to a diverse user base.
  
## Business Cases and Impact

### User Engagement
- 📈 **Expected to attract over 10,000 users within the first six months post-launch** by offering a hassle-free appointment booking experience.

### Operational Efficiency
- ⏱️ **Anticipated reduction of no-show rates by 25%** through automated appointment reminders and confirmations.

### Doctor Network Expansion
- 🌍 **Aim to onboard 1,000 doctors across various specialties in the first year**, enhancing the app’s value proposition for users.

  
## Splash Screen

### Splash Screen

![Screenshot_20240723-184235](https://github.com/user-attachments/assets/22ade276-5ad7-48f4-8244-37a485fa2572)


The splash screen provides a welcoming and professional introduction to the app, setting the tone for the user experience. It displays the DocSpot logo to capture user interest.


## Onboarding Screen

![Screenshot_20240723-184237](https://github.com/user-attachments/assets/40661ca8-aa77-4eaa-aa37-f0a390598d45)


## Sign In & Sign Up

### Sign In

![Screenshot_20240723-184241](https://github.com/user-attachments/assets/8cf5110c-d74a-49fb-bdb2-d233c9a62939)


The sign-in screen allows users to access their accounts securely. Features include:

- **Email/Username Input**: Enter your registered email or username.
- **Password Input**: Secure password field with visibility toggle.
- **Forgot Password**: Option to reset password if forgotten.
- **Sign In Button**: Authenticate and enter the app.
- **Alternative Signin**: Signin using Google, Apple , and Facebook.


### Sign Up

![Screenshot_20240723-184253](https://github.com/user-attachments/assets/efd1d848-b108-411b-beae-247d01752ff9)


The sign-up screen facilitates new user registration. Features include:

- **Full Name Input**: Enter your full name.
- **Phone Number**: Enter Valid Phone Number.
- **Email Input**: Provide a valid email address.
- **Password Input**: Create a secure password.
- **Confirm Password Input**: Re-enter the password for confirmation.
- **Sign Up Button**: Complete the registration process.

## Home Screen

![Home Screen](https://github.com/user-attachments/assets/c3bd851f-626f-4e29-926d-1df71a03c24c)

The home screen of the DocSpot app offers the following features:

- **Greeting Section:** The app greets the user, e.g., "Hi, Ahmed," and asks, "How are you today?"
- **Call to Action:** A blue card prompts the user to "Book and schedule with the nearest doctor" with a "Find Nearby" button.
- **Doctor Speciality Section:** This section lists various doctor specialties such as Cardiology, Dermatology, Neurology, and Orthopedics.
- **Doctor List:** A list of doctors, including their names, titles, phone numbers, and email addresses. 
  
## Installation

To run DocSpot locally, ensure Flutter is installed on your machine. 

## Contributing

Contributions from the community are welcome!.

## Stay Updated

Stay tuned for more updates as development continues and new features are added to enhance the DocSpot experience!

---

Made with ❤️ by Ahmed Adel Hammad
