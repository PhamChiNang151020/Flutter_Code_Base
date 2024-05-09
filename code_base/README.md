# code_base

Tree folder

- `api`: Contains directories to initialize APIs according to intended use
- `base_class`

  - [base_api]: Provides the basis for making API requests within the application.
  - [base_response]: Handles responses from APIs or web services.
  - [storage]: Provides local storage for the application.
  - [base_bloc] Provides BLoC logic for the application.
  - [fire_base] Provides Firebase for the application.

- `widget`

  - [popup]: Handles UI for loading, success, and error states.

- `common`

  - [my_assets]: Imports assets like icons, images, and other assets.
  - [my_colors]: Defines custom colors for the application.
  - [my_sizes]: Defines custom sizes for the application.

- `utils`

  - [internet_helper]: Checks internet connectivity.
  - [screen_key]: Manages key codes for application screens.

# screen

- [screen_bloc]: BLoC is designed to react to events and yields/emits new states. The BLoC manages the state of the form.
- [screen_event]: Events are input into the BLoC to be processed.
- [screen_state]: State contains the status of the form as well as input states.
- [screen_form]: Form handles notifying the BLoC of events and responds to state changes using BlocBuilder and BlocListener.
- [screen_page]: Page is used to create and provide the BLoC to the form.
