import 'package:eat_it_here/auth/auth.dart';
import 'package:eat_it_here/pages/login.dart';
import 'package:eat_it_here/pages/register.dart';
import 'package:eat_it_here/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eat It Here',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const LoginOrRegister(),
    );
  }
}
