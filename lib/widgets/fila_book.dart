import 'package:flutter/material.dart';
import 'package:flutter20240808/modelos/book.dart';

class FilaBook extends StatefulWidget {
  Book libro;
   FilaBook(this.libro, {Key? key}) : super(key: key);

  @override
  _FilaBookState createState() => _FilaBookState();
}

class _FilaBookState extends State<FilaBook> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title:Text( widget.libro.name??"sin titulo"),
        subtitle:Text( widget.libro.autor??"sin autor"),
      ),
    );
  }
}
