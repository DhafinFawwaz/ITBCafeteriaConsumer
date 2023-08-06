import 'package:flutter/material.dart';
import 'package:itb_cafeteria_consumer/utils/GlobalTheme.dart';
import 'screens/kantin/kantin.dart';
import 'screens/nav/nav.dart';
import 'screens/auth/login.dart';
import 'screens/auth/register.dart';
import 'services/shared_service.dart';

Widget _defaultHome = const LoginPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool _result = await SharedService.isLoggedIn();
  if(_result) {
    _defaultHome = const NavPage();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.orange,
      ),
      routes: {
        '/': (context) => _defaultHome,
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const NavPage(),
        // '/kantin': (context) => const KantinPage(),
      },
      
    );
  }
}

