import 'package:flutter/material.dart';
import 'package:gitrepo/redux/middleware/init_middleware.dart';
import 'package:gitrepo/redux/middleware/navigation_middleware.dart';
import 'package:gitrepo/redux/models/app_state.dart';
import 'package:gitrepo/redux/services/api.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createMiddleWare(
  GlobalKey<NavigatorState> navigatorKey,
  ApiService apiService,
)
{
  return [
    ...createInitMiddleware(apiService),
    ...createNavigationMiddleware(navigatorKey),
  ];
}