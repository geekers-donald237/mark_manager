import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root
// of your application.
@override
Widget build(BuildContext context) {
	return MaterialApp(
	title: 'click seulement',
	home: MyForm(),
	);
}
}


class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _iCT202Controller = TextEditingController();
  final _iCT204Controller = TextEditingController();
  final _iCT206Controller = TextEditingController();
  final _iCT208Controller = TextEditingController();
  final _iCT210Controller = TextEditingController();
  final _iCT218Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _idController,
                
                decoration: InputDecoration(
                  labelText: 'matricule',
                ),
              ),
              TextFormField(
                controller: _nomController,
                
                decoration: InputDecoration(
                  labelText: 'nom',
                ),
              ),
              TextFormField(
                controller: _prenomController,
                
                decoration: InputDecoration(
                  labelText: 'prenom',
                ),
              ),
              TextFormField(
                controller: _iCT202Controller,
                
                decoration: InputDecoration(
                  labelText: 'ICT202',
                ),
              ),
              TextFormField(
                controller: _iCT204Controller,
                
                decoration: InputDecoration(
                  labelText: 'iCT204',
                ),
              ),
              TextFormField(
                controller: _iCT206Controller,
               
                decoration: InputDecoration(
                  labelText: 'ICT206',
                ),
              ),
              TextFormField(
                controller: _iCT208Controller,
                
                decoration: InputDecoration(
                  labelText: 'ICT208',
                ),
              ),
              TextFormField(
                controller: _iCT210Controller,
                
                decoration: InputDecoration(
                  labelText: 'ICT210',
                ),
              ),
              TextFormField(
                controller: _iCT218Controller,
                decoration: InputDecoration(
                  labelText: 'ICT218',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    
                      await Firebase.initializeApp();
                      FirebaseFirestore.instance.collection('etudiants').add({
                        'matricule': _idController.text,
                        'nom': _nomController.text,
                        'note':
                        {
                          'ICT202': _iCT202Controller.text,
                          'ICT204': _iCT204Controller.text,
                          'ICT206': _iCT206Controller.text,
                          'ICT208': _iCT208Controller.text,
                          'ICT210': _iCT210Controller.text,
                          'ICT218': _iCT218Controller.text,
                        },
                        'prenom': _prenomController.text,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Form submitted')),
                      );
                    
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}