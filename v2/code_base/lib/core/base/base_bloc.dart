import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<Event, State> extends Bloc<Event, State> {
  BaseBloc(State initialState) : super(initialState);

  /// Common bloc methods can be added here

  void handleError(Object error, StackTrace stackTrace) {
    // Add common error handling logic here
    log('Error occurred: $error');
    addError(error, stackTrace);
  }

  // * For cleanup
  void dispose() {
    close();
  }
}
