import 'package:flutter/material.dart';
import 'package:flutter20240808/paginas/pagina_book_listar.dart';
import 'package:flutter20240808/paginas/pagina_login.dart';
import 'package:flutter20240808/paginas/pagina_producto_insertar.dart';
import 'package:flutter20240808/paginas/pagina_producto_listar.dart';

void main() {
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PaginaBookListar(),
    );
  }
}
