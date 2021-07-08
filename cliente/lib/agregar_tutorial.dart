import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class AgregarTutorial extends StatefulWidget {
  @override
  _AgregarTutorialState createState() => _AgregarTutorialState();
}

class _AgregarTutorialState extends State<AgregarTutorial> {

  TextEditingController controlTitle = new TextEditingController();
  TextEditingController controlDescription = new TextEditingController();
  //TextEditingController controlPublished = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("AGREGAR TUTORIAL"),
      ),

      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            children: <Widget>[

              new TextField(
                controller: controlTitle,
                decoration: new InputDecoration(
                    labelText: "titulo"
                ),
              ),

              new TextField(
                controller: controlDescription,
                decoration: new InputDecoration(
                    labelText: "Descripcion"
                ),
              ),
              /*
              new TextField(
                controller: controlPublished,
                decoration: new InputDecoration(
                    labelText: "Publicado"
                ),
              ),
              */
              new RaisedButton(
                child: new Text("Agregar Tutorial"),
                onPressed: () {

                  agregarTutorial();
                  Navigator.of(context).pop();

                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  void agregarTutorial() {
    var url = Uri.parse("http://127.0.0.1:8000/api/tutorials/9");
    http.post(url, body: {
      "titulo": controlTitle.text,
      "Descripcion": controlDescription.text,
      //"email": controlEmail.text,
    });
  }

}

