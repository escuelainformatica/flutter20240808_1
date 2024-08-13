import 'package:flutter/material.dart';
import 'package:flutter20240808/contenidopaginas/listview_book.dart';
import 'package:flutter20240808/contenidopaginas/listview_productos.dart';

class PaginaBookListar extends StatefulWidget {
  const PaginaBookListar({Key? key}) : super(key: key);

  @override
  _PaginaBookListarState createState() => _PaginaBookListarState();
}

class _PaginaBookListarState extends State<PaginaBookListar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListviewBook(),
    );
  }
}
