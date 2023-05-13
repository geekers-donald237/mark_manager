import 'dart:html';

import 'package:flutter/material.dart';

class notesForm extends StatelessWidget {
  const notesForm({Key? key, required this.list}) : super(key: key);

  final List<String> list;


  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      appBar: ,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: ListView(
            children: [
              Form(child:
                  ListView(
              children: [
                SizedBox(height: 30),
                  buildTextField("matière 1", ""),
                  buildTextField("matière 2", ""),
                  buildTextField("matière 3", ""),
              SizedBox(height: 30),

            ],)
          ),
              Container(
                child: ElevatedButton(
                  child:
                  Text("save", style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 2,
                    color: Colors.white,
                  )),
                  onPressed: () {
                    CircularProgressIndicator(),
                  },
                ),
              )
            ],
          )
        ),

      ),

    );*/

    return Scaffold(
      appBar: AppBar(
        title: Text("Formulaire"),
      ),
      body: Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'matière 1'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'matière 2'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'matière 3'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'matière 4'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if () {
                        // Ajouter les notes dans fire base
                      }
                    },
                    child: Text('Soumettre'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Clear the form fields.
                    },
                    child: Text('Annuler'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String placeholder) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black
            )
        ),
      ),
    );
  }

}


