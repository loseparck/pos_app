import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/app/auth_gate.dart';
import 'package:pos_app/app/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;

  runApp(
    const ProviderScope(
      child: MainApp()
      )
    );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    /*return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pos App",
      home: AuthGate(
        child: const MainPage(),
      ),
    );
  }
}
