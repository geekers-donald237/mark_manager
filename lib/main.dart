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
	home: AddData(),
	);
}
}

class AddData extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		backgroundColor: Colors.green,
		title: Text("envoyer sur firebase"),
	),
	body:Center(
		child: FloatingActionButton(
		backgroundColor: Colors.green,
		child: Icon(Icons.add),
		onPressed: () {
			FirebaseFirestore.instance
				.collection('etudiant')
				.add
        ({
          'matricule': '21U2673', 
          'nom':'imperial', 
          'notes':{'ict202':100, 'ict204':98, 'ict206':88, 'ict208':82, 'ict210':90, 'ict218':68, }, 
          'prenom':'borel',
        });
		},
		),
	),
	);
}
}
