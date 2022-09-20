import 'package:flutter/material.dart';
import 'package:locals_demo/ui/screens/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark(),
      ),
      home: const LoginView(),
      themeMode: ThemeMode.dark,
      title: 'Locals Demo',
    );
  }
}
