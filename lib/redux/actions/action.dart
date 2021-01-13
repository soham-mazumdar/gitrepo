abstract class AppAction{}

class InitAppAction extends AppAction {

  InitAppAction();

  @override @override String toString() {
    return "InitAppAction";
  }
}


class LoadedAction extends AppAction{}

class IsLoadingAction extends AppAction {
  bool isloading;
  IsLoadingAction(this.isloading);

  @override @override String toString() {
    return "IsLoadingAction{$isloading}";
  }
}
