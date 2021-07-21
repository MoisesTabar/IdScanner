import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:id_scanner/src/app.dart';
import 'package:id_scanner/src/providers/person_provider.dart';
import 'package:provider/provider.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(
    ChangeNotifierProvider(
      create: (_) => PersonProvider(),
      child: App()
    )
  );
}