import 'package:flutter/material.dart';
import 'package:flutter20240808/contenidopaginas/contenidologin.dart';

class PaginaLogin extends StatefulWidget {
  const PaginaLogin({Key? key}) : super(key: key);

  @override
  _PaginaLoginState createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Contenidologin()
    );
  }
}
