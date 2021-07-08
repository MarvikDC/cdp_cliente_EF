import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'editar_tuturial.dart';

class DetallesTutorial extends StatefulWidget {

  int index;
  List lista;

  DetallesTutorial({ required this.index, required this.lista });

  @override
  _DetallesTutorialState createState() => _DetallesTutorialState();

}

class _DetallesTutorialState extends State<DetallesTutorial> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("DETALLES DEL TUTORIAL"),
      ),

      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Center(
          child: Column(
            children: <Widget>[

              /*new Text(
                "id: "+widget.lista[widget.index]['id'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              */

              new Text(
                "Titulo: "+widget.lista[widget.index]['title'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),

              new Text(
                "Descripcion: "+widget.lista[widget.index]['description'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),

              /*new Text(
                "Publicado: "+widget.lista[widget.index]['published'],
                style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),*/

              new RaisedButton(
                child: Text("EDITAR"),
                onPressed: () {

                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    new MaterialPageRoute(builder: (BuildContext context) => new EditarTutorial(
                      lista: widget.lista,
                      index: widget.index,
                    ),
                    ),
                  );

                },
              ),

              new RaisedButton(
                child: Text("BORRAR"),
                onPressed: () {
                  String tex1 = widget.lista[widget.index]['id'];
                  String tex2 = "http://127.0.0.1:8000/api/tutorials/" + tex1;
                  var url = Uri.parse(tex2);
                  http.delete(url);

                  Navigator.of(context).pop();

                },
              ),

            ],
          ),
        ),
      ),

    );
  }

}