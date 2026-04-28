import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_app/main_app.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  //final dir = await getApplicationDocumentsDirectory();

  /*final isar = await Isar.open(
    [
      ProductIsarSchema,
      ProductGroupIsarSchema,
      ProductOptionIsarSchema,
    ],
    directory: dir.path,
    name: 'pos_db',
  );*/

  runApp(
    ProviderScope(
      overrides: [
       // isarInstanceProvider.overrideWithValue(isar),
      ],
      child: const MainApp(),
    ),
  );
}