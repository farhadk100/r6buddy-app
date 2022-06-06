import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r6buddy/providers/operators_provider.dart';
import 'package:r6buddy/utilities/dio_manager.dart';

import 'screens/operators_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DioManager>(
          create: (_) => DioManager(),
        ),
      ],
      child: MaterialApp(
        title: 'R6Buddy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color.fromARGB(255, 7, 28, 54),
          textTheme: Typography(platform: TargetPlatform.iOS).white,
        ),
        routes: {
          '/': (context) => ChangeNotifierProvider(create: (context) => OperatorsProvider(Provider.of<DioManager>(context, listen: false)), child: const OperatorsScreen()),
        },
      ),
    );
  }
}