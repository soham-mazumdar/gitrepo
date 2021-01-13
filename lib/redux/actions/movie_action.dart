import 'package:gitrepo/redux/actions/action.dart';
import 'package:gitrepo/redux/models/profile.dart';

class SearchUserAction extends AppAction{
  final String username;

  SearchUserAction({this.username});

  @override String toString() => "SearchUserAction{$username}";
}


class SaveCurrentUserAction extends AppAction{

  final Profile profile;
  SaveCurrentUserAction(this.profile);

  @override String toString() => "SaveCurrentUserAction{$profile}";
}

class FormErrorAction extends AppAction {}

