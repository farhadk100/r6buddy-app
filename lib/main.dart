import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r6buddy/route_generator.dart';
import 'package:r6buddy/utilities/dio_manager.dart';

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
          scaffoldBackgroundColor: Color.fromARGB(255, 33, 46, 80),
          textTheme: Typography(platform: TargetPlatform.iOS).white.copyWith(
            subtitle1: const TextStyle(
              color: Colors.white60,
              fontSize: 16,
            ),
          ),
        ),
        initialRoute: '/',
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      ),
    );
  }
}