# Gym Application

Gym Application is a full-stack fitness management system designed to manage gym memberships, workouts, and user authentication. The backend is built with **Django REST Framework** using **JWT (JSON Web Tokens)** for secure authentication, while the frontend is developed with **Flutter** for a cross-platform mobile experience, managed in **Android Studio**.

## Table of Contents
- [Features](#features)
- [Technologies](#technologies)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [Backend Setup (Django REST Framework)](#backend-setup-django-rest-framework)
  - [Frontend Setup (Flutter)](#frontend-setup-flutter)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Authentication](#authentication)
- [Contributing](#contributing)
- [License](#license)

## Features
- User registration and login with JWT-based authentication.
- Management of gym memberships, workout plans, and user profiles.
- Responsive and user-friendly mobile interface built with Flutter.
- Secure API endpoints for CRUD operations on gym-related data.
- Cross-platform support for Android (iOS support can be added with Flutter).

## Technologies
- **Backend**:
  - Python 3.8+
  - Django 4.x
  - Django REST Framework
  - JWT (via `djangorestframework-simplejwt`)
  - SQLite (default, can be configured for PostgreSQL or other databases)
- **Frontend**:
  - Flutter 3.x
  - Dart
  - Android Studio
- **Others**:
  - Git for version control
  - Android Emulator or physical device for testing

## Prerequisites
Before setting up the project, ensure you have the following installed:
- Python 3.8+ (for backend)
- pip (Python package manager)
- Node.js (optional, for some Flutter dependencies)
- Flutter SDK (for frontend)
- Android Studio (with Android Emulator configured)
- Git
- A code editor (e.g., VS Code, PyCharm, or Android Studio)

## Installation

### Backend Setup (Django REST Framework)
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Jeremitc/GymAplication.git
   cd GymAplication/backend
   ```

2. **Create a Virtual Environment**:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install Dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

4. **Configure Environment Variables**:
   - Create a `.env` file in the `backend` directory.
   - Add the following (replace with your values):
     ```env
     SECRET_KEY=your_django_secret_key
     DEBUG=True
     DATABASE_URL=sqlite:///db.sqlite3
     ```

5. **Run Migrations**:
   ```bash
   python manage.py makemigrations
   python manage.py migrate
   ```

6. **Create a Superuser** (optional, for admin access):
   ```bash
   python manage.py createsuperuser
   ```

7. **Start the Development Server**:
   ```bash
   python manage.py runserver
   ```
   The backend API will be available at `http://127.0.0.1:8000/`.

### Frontend Setup (Flutter)
1. **Navigate to the Frontend Directory**:
   ```bash
   cd ../frontend
   ```

2. **Install Flutter Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Configure API Base URL**:
   - Open `lib/config.dart` (or similar configuration file).
   - Update the API base URL to point to your backend:
     ```dart
     const String apiBaseUrl = 'http://127.0.0.1:8000/api/';
     ```

4. **Run the Flutter App**:
   - Ensure an Android Emulator is running or a physical device is connected.
   - Run the app:
     ```bash
     flutter run
     ```

5. **Build for Production** (optional):
   ```bash
   flutter build apk --release
   ```

## Usage
1. **Backend**:
   - Access the Django admin panel at `http://127.0.0.1:8000/admin/` to manage users, memberships, and workouts.
   - Use tools like Postman or cURL to test API endpoints.

2. **Frontend**:
   - Launch the Flutter app on an emulator or device.
   - Register a new user or log in with existing credentials.
   - Explore features like viewing workout plans, managing memberships, or updating user profiles.

## API Endpoints
Here are some key API endpoints (base URL: `http://127.0.0.1:8000/api/`):
- **Authentication**:
  - `POST /auth/register/` - Register a new user
  - `POST /auth/login/` - Obtain JWT token
  - `POST /auth/refresh/` - Refresh JWT token
- **Gym Management**:
  - `GET /workouts/` - List all workouts
  - `POST /workouts/` - Create a new workout
  - `GET /memberships/` - List all memberships
  - `PUT /users/profile/` - Update user profile

For a full list of endpoints, refer to the Django REST Framework browsable API at `http://127.0.0.1:8000/` or check the `urls.py` files in the backend.

## Authentication
The backend uses **JWT** for authentication:
- Register or log in to receive an access token and refresh token.
- Include the access token in the `Authorization` header for protected endpoints:
  ```http
  Authorization: Bearer <your_access_token>
  ```
- Use the refresh token to obtain a new access token when it expires.

## Contributing
Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Make your changes and commit (`git commit -m "Add your feature"`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Open a Pull Request.

Please ensure your code follows the project's coding standards and includes tests where applicable.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
