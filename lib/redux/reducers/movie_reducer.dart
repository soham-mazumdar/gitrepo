import 'package:gitrepo/redux/actions/action.dart';
import 'package:gitrepo/redux/actions/movie_action.dart';
import 'package:gitrepo/redux/models/profile.dart';
import 'package:redux/redux.dart';


final loadingReducer = combineReducers<bool>([
  new TypedReducer<bool, IsLoadingAction>(_isLoading),
]);

bool _isLoading(bool meds, IsLoadingAction action) {
  return action.isloading;
}

final currentUserReducer = combineReducers<Profile>([
  new TypedReducer<Profile, SaveCurrentUserAction>(_currentUser),
]);

Profile _currentUser(Profile nowPlaying, SaveCurrentUserAction action) {
  return action.profile;
}

final hasErrorReducer = combineReducers<bool>([
  new TypedReducer<bool, FormErrorAction>(_hasError),
]);

bool _hasError(bool nowPlaying, FormErrorAction action) {
  return true;
}
