import 'package:gitrepo/redux/models/profile.dart';
import 'package:gitrepo/redux/routes/routes.dart';

class AppState {
  final bool isLoading;
  final List<String> routes;
  final Profile currentUser;
  final bool hasError;

  AppState({
    this.isLoading,
    this.routes,
    this.currentUser,
    this.hasError
  });

  factory AppState.initial(){
    return AppState(
      isLoading: false,
      routes: [AppRoutes.home],
      hasError: false
    );
  }

  AppState copyWith({
    bool newIsLoading,
    List<String> newRoutes,
    Profile newCurrentUser,
    bool newHasError,
  })
  {
    return AppState(
      isLoading: newIsLoading ?? this.isLoading,
      routes: newRoutes ?? this.routes,
      currentUser: newCurrentUser ?? this.currentUser,
      hasError: newHasError ?? this.hasError
    );
  }
}