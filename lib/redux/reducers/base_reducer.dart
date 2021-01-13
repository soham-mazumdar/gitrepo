
import 'package:gitrepo/redux/models/app_state.dart';
import 'package:gitrepo/redux/reducers/navigation_reducer.dart';
import 'package:gitrepo/redux/reducers/movie_reducer.dart';

AppState baseReducer(AppState oldState, dynamic action)
{
  return oldState.copyWith(
    newRoutes: navigationReducer(oldState.routes, action),
    newIsLoading: loadingReducer(oldState.isLoading, action),
    newCurrentUser: currentUserReducer(oldState.currentUser, action),
    newHasError: hasErrorReducer(oldState.hasError,action)
  );
}