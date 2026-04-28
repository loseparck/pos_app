import 'package:flutter/material.dart';
import 'package:pos_app/app/auth_gate.dart';
import 'package:pos_app/app/main_page.dart';
import 'bootstrap_stub.dart'
    if (dart.library.io) 'bootstrap_native.dart'
    if (dart.library.js_interop) 'bootstrap_web.dart';

Future<void> main() async {
  await bootstrap();
  /*WidgetsFlutterBinding.ensureInitialized;


  if(kIsWeb){
    runApp(
      ProviderScope(
        child: const MainApp()
      )
    );
    return;
  } else {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [
        ProductIsarSchema,
        ProductGroupIsarSchema,
        ProductOptionIsarSchema,
      ],
      directory: dir.path,
      name: 'pos_db',
    );
    runApp(
    ProviderScope(
      overrides: [
        isarInstanceProvider.overrideWithValue(isar),
      ],
      child: const MainApp()
      )
    );
  }*/

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
      ), //Management(),
    );
  }
}
