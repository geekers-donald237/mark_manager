import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  bool isLoading = false;

  Future<void> submitForm() async {
    setState(() {
      isLoading = true;
    });
    if (_idController.text.isEmpty ||
        _nomController.text.isEmpty ||
        _prenomController.text.isEmpty ||
        _iCT202Controller.text.isEmpty ||
        _iCT204Controller.text.isEmpty ||
        _iCT206Controller.text.isEmpty ||
        _iCT208Controller.text.isEmpty ||
        _iCT210Controller.text.isEmpty ||
        _iCT218Controller.text.isEmpty) {

      Fluttertoast.showToast(
        msg: "Veuillez remplir tous les champs",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          fontSize: 16.0);
      return;
    }

    // vérifier que les notes sont entre 0 et 100
    if (int.tryParse(_iCT202Controller.text) == null ||
        int.tryParse(_iCT202Controller.text)! < 0 ||
        int.tryParse(_iCT202Controller.text)! > 100 ||
        int.tryParse(_iCT204Controller.text) == null ||
        int.tryParse(_iCT204Controller.text)! < 0 ||
        int.tryParse(_iCT204Controller.text)! > 100 ||
        int.tryParse(_iCT206Controller.text) == null ||
        int.tryParse(_iCT206Controller.text)! < 0 ||
        int.tryParse(_iCT206Controller.text)! > 100 ||
        int.tryParse(_iCT208Controller.text) == null ||
        int.tryParse(_iCT208Controller.text)! < 0 ||
        int.tryParse(_iCT208Controller.text)! > 100 ||
        int.tryParse(_iCT210Controller.text) == null ||
        int.tryParse(_iCT210Controller.text)! < 0 ||
        int.tryParse(_iCT210Controller.text)! > 100 ||
        int.tryParse(_iCT218Controller.text) == null ||
        int.tryParse(_iCT218Controller.text)! < 0 ||
        int.tryParse(_iCT218Controller.text)! > 100) {
      Fluttertoast.showToast(
        msg: "Les notes doivent être des nombres entre 0 et 100",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          fontSize: 16.0);
      return;
    }

     try{
       await FirebaseFirestore.instance
           .collection('etudiants')
           .doc(_idController.text.toLowerCase())
           .set({
         'matricule': _idController.text.trim(),
         'nom': _nomController.text.trim(),
         'note': {
           'ICT202': _iCT202Controller.text.trim(),
           'ICT204': _iCT204Controller.text.trim(),
           'ICT206': _iCT206Controller.text.trim(),
           'ICT208': _iCT208Controller.text.trim(),
           'ICT210': _iCT210Controller.text.trim(),
           'ICT218': _iCT218Controller.text.trim(),
         },
         'prenom': _prenomController.text.trim(),
       });
       Fluttertoast.showToast(
           msg: "Informations save successfully",
           backgroundColor: Colors.indigo,
           textColor: Colors.white,
           toastLength: Toast.LENGTH_LONG,
           timeInSecForIosWeb: 3,
           gravity: ToastGravity.CENTER,
           fontSize: 16.0);
       _iCT202Controller.clear();
       _iCT204Controller.clear();
       _iCT206Controller.clear();
       _iCT208Controller.clear();
       _iCT210Controller.clear();
       _iCT218Controller.clear();
       _idController.clear();
       _nomController.clear();
       _prenomController.clear();
       print('Infos ajouté avec succès');
     }catch(error){
       Fluttertoast.showToast(
           msg: "Error sending info",
           backgroundColor: Colors.red,
           textColor: Colors.white,
           toastLength: Toast.LENGTH_LONG,
           gravity: ToastGravity.CENTER,
           timeInSecForIosWeb: 3,
           fontSize: 16.0);
       print("Erreur lors l'ajout !");
     }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Form'),
      ),
      body: isLoading ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child:  Form(
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
                        await submitForm();
                        setState(() {
                          isLoading = false;
                        });
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(content: Text('Form submitted')),
                        // );
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}