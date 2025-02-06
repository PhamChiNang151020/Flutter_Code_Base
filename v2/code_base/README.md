# CodeBase

**CodeBase** is a Flutter application built following the **Clean Architecture** principles and utilizing the **BLoC pattern** for state management. The project leverages technologies such as **Dio** for HTTP requests and **GetIt/Injectable** for Dependency Injection (DI) to create a scalable, maintainable, and testable system.

---

## Architecture & Explanation

### 1. Clean Architecture & Layered Structure
- **Core:** Contains shared components such as API configuration (`ApiClient`, `endpoints`, `interceptors`), base classes (`base_bloc`, `base_page`, `base_state`), constants, and route definitions.  
- **Data:** Includes models, repositories, and datasources. This layer handles data retrieval from APIs or local storage.  
- **Domain:** (Extendable) This layer is responsible for entities, use cases, and repository interfaces in Clean Architecture.  
- **Features:** Each feature (e.g., Home, Splash) has its own set of files, including Bloc, Event, State, and Page, to manage UI and business logic.  
- **Utils:** Contains utility functions such as validators, storage handlers, and general-purpose helpers.

### 2. State Management with BLoC Pattern
- **BLoC Pattern:** Each feature has a Bloc responsible for handling business logic and transforming states from the initial state to different states like loading, success, or error.  
- This separation ensures clear distinction between logic and UI, improving maintainability and testability.

### 3. API Communication using Dio
- **Dio:** Configured within the `ApiClient` class to manage HTTP requests. Interceptors are implemented for logging requests, responses, and handling errors consistently.  
- **Repository Pattern:** The repository (e.g., `PostRepository`) is responsible for fetching data from APIs and converting it into structured models (e.g., `Post`).  
- This separation keeps data retrieval logic independent from business logic.

### 4. Dependency Injection with GetIt & Injectable
- **DI Container:** The project uses GetIt with Injectable for centralized dependency management. Services and repositories are registered via DI modules, making it easy to replace or mock dependencies during testing.  
- **DI Configuration:** The `service_locator.dart` and generated `service_locator.config.dart` files automate dependency registration. Run the build command to update them when necessary.

### 5. Exception Handling
- **Error Handling:** Custom exceptions (e.g., `ServerException`) are used to categorize API errors. These exceptions are thrown from repositories and can be processed in Bloc to display appropriate error messages in the UI.

---

## Installation & Running the Application

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/yourusername/code_base.git
   cd code_base

2. **Install Dependencies:**
    ```bash
    flutter pub get

3. **Generate Dependency Injection Configuration:**
    This project uses injectable and build_runner to generate the service_locator.config.dart file. Run:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
    ```

    To enable automatic updates when changes occur:
    ```bash
   flutter pub run build_runner watch --delete-conflicting-outputs
    ```
