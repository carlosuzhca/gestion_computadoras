import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io'; // Para detectar la plataforma

import 'db/database_helper.dart';
import 'welcome_screen.dart';
import 'computadoras_screen.dart';
import 'edit_computadora_screen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Asegura la inicialización de Flutter

  // Inicializa FFI en plataformas de escritorio
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit(); // Inicializa sqflite_common_ffi para entornos de escritorio
    databaseFactory =
        databaseFactoryFfi; // Asigna databaseFactoryFfi a databaseFactory
  }

  await DatabaseHelper().initializeDB(); // Inicializa la base de datos

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Computadoras',
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/computadoras': (context) => ComputadorasScreen(),
        '/edit_computadora': (context) => EditComputadoraScreen(),
      },
    );
  }
}
