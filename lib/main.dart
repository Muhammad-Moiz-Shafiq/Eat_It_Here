import 'package:eat_it_here/auth/auth.dart';
import 'package:eat_it_here/pages/login.dart';
import 'package:eat_it_here/pages/register.dart';
import 'package:eat_it_here/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/restaurant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(),
      ),
      ChangeNotifierProvider<Restaurant>(
        create: (_) => Restaurant(),
      ),
    ], child: const MyApp()),
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
