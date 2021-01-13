import 'package:gitrepo/redux/services/api.dart';
import 'package:gitrepo/ui/DetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gitrepo/redux/actions/action.dart';
import 'package:gitrepo/redux/middleware/middleware.dart';
import 'package:gitrepo/redux/models/app_state.dart';
import 'package:gitrepo/redux/reducers/base_reducer.dart';
import 'package:gitrepo/redux/routes/routes.dart';
import 'package:gitrepo/ui/HomePage.dart';
import 'package:redux/redux.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Store<AppState> store = Store<AppState>(baseReducer,
      initialState: AppState.initial(),
      middleware: createMiddleWare(
        navigatorKey,
        ApiService(),
      ));
  store.dispatch(InitAppAction());
  return runApp(Quotes(store));
}

class Quotes extends StatelessWidget {
  final Store<AppState> store;

  Quotes(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child:
            StoreConnector<AppState, Map<String, dynamic>>(converter: (store) {
          final Map<String, dynamic> args = {};
          return args;
        }, builder: (context, args) {
          return MaterialApp(
            initialRoute: '/',
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            navigatorObservers: [routeObserver],
            theme: ThemeData(
                primaryColor: Color.fromRGBO(80, 82, 162, 1),
                canvasColor: Color.fromRGBO(34, 34, 34, 1),
                brightness: Brightness.light,
                textTheme: TextTheme(
                  bodyText1: TextStyle(color: Colors.white),
                  bodyText2: TextStyle(color: Colors.white),
                  button: TextStyle(color: Colors.white),
                  subtitle1: TextStyle(color: Colors.white),
                )),
            onGenerateRoute: (RouteSettings settings) =>
                _resolveRoute(settings),
          );
        }));
  }

  PageRoute _resolveRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MainRoute(HomePage(), settings: settings);
      case AppRoutes.details:
        return FabRoute(DetailPage(), settings: settings, direction: 'right');
      default:
        return MainRoute(HomePage(), settings: settings);
    }
  }
}
