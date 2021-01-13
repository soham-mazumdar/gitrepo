import 'package:gitrepo/redux/actions/action.dart';
import 'package:gitrepo/redux/actions/movie_action.dart';
import 'package:gitrepo/redux/actions/navigator_actions.dart';
import 'package:gitrepo/redux/models/app_state.dart';
import 'package:gitrepo/redux/routes/routes.dart';
import 'package:gitrepo/redux/services/api.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createInitMiddleware(
  ApiService apiService,
){
	return[
	  TypedMiddleware<AppState, SearchUserAction>(_getUser(apiService)),
  ];
}



void Function(Store<AppState> store, SearchUserAction action, NextDispatcher next)
_getUser(ApiService apiService) {
  	return (store, action, next) {

      store.dispatch(new IsLoadingAction(true));
      apiService.getUser(action.username).then((value){
        if(value == null){
          print('please chk username');
          store.dispatch(new FormErrorAction());
          store.dispatch(new IsLoadingAction(false));
        }
        else{
          store.dispatch(new SaveCurrentUserAction(value));
          store.dispatch(new NavigatorPushAction(AppRoutes.details));
          store.dispatch(new IsLoadingAction(false));
        }
        
      });
    	next(action);
	};
}


