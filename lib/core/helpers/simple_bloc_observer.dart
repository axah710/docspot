import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/// A custom [BlocObserver] implementation that provides logging and debugging information
/// about the lifecycle of [Bloc] and [Cubit] instances.
///
/// This observer overrides several methods to log events such as when a [Bloc] or [Cubit]
/// is created, when its state changes, when a state transition occurs, when an error
/// occurs, and when a [Bloc] or [Cubit] is closed.
///
/// The logging is only enabled when the app is running in debug mode (i.e., when
/// [kDebugMode] is true).

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      print("Bloc created: $bloc");
    }
  }
  // This method is invoked when a Bloc or Cubit is created. It allows for initial setup or logging.

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print("State change in $bloc: $change");
    }
  }
  // This method is triggered whenever there is a state change in any Bloc or Cubit.

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print("State transition in $bloc: $transition");
    }
  }
  // This method handles state transitions for Bloc instances. It provides detailed information on transitions, including the current state, the event, and the next state.

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (kDebugMode) {
      print("Error in $bloc: $error\nStackTrace: $stackTrace");
    }
  }
  // This method is triggered when an error occurs in a Bloc or Cubit. It logs the error and the associated stack trace.

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      print("Bloc closed: $bloc");
    }
  }
  // This method is called just before a Bloc or Cubit is closed. It's useful for cleanup or logging purposes.
}
// SimpleBlocObserver is a custom BlocObserver that extends the default
// BlocObserver class. It overrides several methods to provide logging and
// debugging information about the lifecycle of Blocs and Cubits.