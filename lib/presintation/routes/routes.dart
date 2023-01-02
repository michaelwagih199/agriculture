import 'package:agriculture/presintation/screens/admin/temp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agriculture/utils/constant/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/admin/admin-screen.dart';
import '../screens/home/bloc/home_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ADMIN_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CounterBloc(),
            child: const AdminScreen(title: 'Admin Page'),
          ),
        );
      case LOGIN_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CounterBloc(),
            child: CsvToList(),
          ),
        );
      default:
        return null;
    }
  }
}
