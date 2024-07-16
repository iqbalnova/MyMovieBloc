import 'package:flutter/material.dart';
import 'package:mymoviebloc/app.dart';
import 'package:mymoviebloc/config/locator.dart';

final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Locator().setupDepedencyInjection();

  runApp(MyApp(
    navigatorKey: globalKey,
  ));
}
