import 'package:agriculture/presintation/screens/admin/bloc/admin_bloc.dart';
import 'package:agriculture/presintation/screens/cold_functions/cloud-function-screen.dart';
import 'package:agriculture/presintation/screens/home/home-screen.dart';
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
            create: (context) => AdminBloc(),
            child: const AdminScreen(title: 'Admin Page'),
          ),
        );
      case HOME_ROUTE:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CounterBloc(),
            child: HomeScreen(title: 'الرئيسية'),
          ),
        );
        case HOME_ROUTE:
        return MaterialPageRoute(
          builder: (_) => CloudFunctionsScreen(title: 'الرئيسية')
        );
      default:
        return null;
    }
  }
}
