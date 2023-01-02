import 'package:agriculture/presintation/routes/routes.dart';
import 'package:agriculture/themes/style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(AgricultureApp(
      router: AppRouter(),
    ));
  });
}

class AgricultureApp extends StatelessWidget {
  final AppRouter router;

  const AgricultureApp({required this.router}) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      onGenerateRoute: router.generateRoute,
    );
  }
}
