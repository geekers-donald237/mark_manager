import 'dart:html';

import 'package:flutter/material.dart';

class notesForm extends StatelessWidget {
  const notesForm({Key? key, required this.list}) : super(key: key);

  final List<String> list;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: ListView(
            children: [

              SizedBox(height: 30),
              buildTextField("matière 1", ""),
              buildTextField("matière 2", ""),
              buildTextField("matière 3", ""),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  borderRadius: ,
                ),
                child: ElevatedButton(
                  child:
                  Text("save", style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 2,
                    color: Colors.white,
                  )),
                  onPressed: (),
                ),
              )
            ],
          )
        ),

      ),

    );
  }

  Widget buildTextField( String label, String placeholder){
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
