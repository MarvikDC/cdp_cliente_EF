import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class EditarTutorial extends StatefulWidget {

  final List lista;
  int index;

  EditarTutorial({ required this.lista, required this.index });

  @override
  _EditarTutorialState createState() => _EditarTutorialState();

}

class _EditarTutorialState extends State<EditarTutorial> {

  TextEditingController controlTitle = new TextEditingController();
  TextEditingController controlDescription = new TextEditingController();
  //TextEditingController controlPublished = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("EDITAR TUTORIAL"),
      ),

      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            children: <Widget>[

              /*new Text(
                  "ID: "+widget.lista[widget.index]['id']
              ),*/

              new TextField(
                controller: controlTitle,
                decoration: new InputDecoration(
                    labelText: "Titulo"
                ),
              ),

              new TextField(
                controller: controlDescription,
                decoration: new InputDecoration(
                    labelText: "Descripcion"
                ),
              ),

              /*new TextField(
                controller: controlPublished,
                decoration: new InputDecoration(
                    labelText: "Publicado"
                ),
              ),*/

              new RaisedButton(
                child: Text("Editar Tutorial"),
                onPressed: () {

                  editarTutorial();
                  Navigator.of(context).pop();

                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  void editarTutorial() {
    var tex1 = widget.lista[widget.index]['id'];
    String tex2 = "http://127.0.0.1:8000/api/tutorials/" + tex1;
    var url = Uri.parse(tex2);
    http.put(url, body: {
      "title": controlTitle.text,
      "description": controlDescription.text,
      //"published": controlPublished.text,
    });
  }

}