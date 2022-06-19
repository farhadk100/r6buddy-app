
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r6buddy/maps/operator_map.dart';
import 'package:r6buddy/providers/main_page_provider.dart';
import 'package:r6buddy/providers/operator_info_provider.dart';
import 'package:r6buddy/screens/main_page.dart';
import 'package:r6buddy/screens/operator_info_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/operatorInfo':
        if (args is Operator) {
          return MaterialPageRoute(builder: (_) => ChangeNotifierProvider(create: (context) => OperatorInfoProvider(context, args), child: const OperatorInfoScreen()));
        } else {
          return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Something went wrong'))));
        }
      case '/':
      default:
        return MaterialPageRoute(builder: (_) => ChangeNotifierProvider(create: (context) => MainPageProvider(), child: const MainPageScreen()));
    }
  }
}