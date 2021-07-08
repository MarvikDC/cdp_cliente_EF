import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:async';

import 'agregar_tutorial.dart';
import 'detalles_tutorial.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ListaTutoriales(),
    );
  }
}

class ListaTutoriales extends StatefulWidget {
  @override
  _ListaTutorialesState createState() => _ListaTutorialesState();
}

class _ListaTutorialesState extends State<ListaTutoriales> {

  Future<List> obtenerTutoriales() async {
    final response = await http.get(Uri.parse("http://127.0.0.1:8000/api/tutorials"),
      headers: {HttpHeaders.authorizationHeader: "Token 85aff0bf76d22398e8c1218c6ab7e1b0eb0e4fb3"},
    );
    return json.decode(response.body);
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("LISTA DE TUTORIALES"),
      ),

      body: new FutureBuilder<List> (
        future: obtenerTutoriales(),
        builder: (context, snapshot) {
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ElementoLista(
            lista: snapshot.data!,
                )
              : new Center(
            child: new CircularProgressIndicator(),
          );
        },
      ),

      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
            new MaterialPageRoute(builder: (BuildContext context) => new AgregarTutorial(),
            )
        ),
      ),
    );
  }
}

class ElementoLista extends StatelessWidget {

  final List lista;

  ElementoLista({required this.lista });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
      itemCount: lista == null ? 0 : lista.length,
      itemBuilder: (context, posicion) {
        return new Container(
          padding: EdgeInsets.all(2.0),
          child: new GestureDetector(
            onTap: () {

              Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new DetallesTutorial(
                      index: posicion,
                      lista: lista,
                    ),
                  )
              );
            },

            child: new Card(
              color: Colors.blueGrey,
              child: new Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                 // lista[posicion]['id']+": "+
                  lista[posicion]['title'],
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),

          ),
        );
      },
    );
  }
}
