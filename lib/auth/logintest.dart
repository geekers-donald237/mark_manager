import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../components/my_textfield.dart';


class LoginPage extends StatefulWidget {
  final Function()? onTap;
const  LoginPage({super.key , required this.onTap});

  @override
  _LoginPageState createState() => _LoginPageState();
// State<LoginPage> createState() => _LoginPageState();
}

final TextEditingController controller = TextEditingController();

Future<bool> doesDocumentExist(String documentName) async {
  final QuerySnapshot result = await FirebaseFirestore.instance
      .collection('etudiants')
      .where('document_name_field', isEqualTo: documentName)
      .limit(1)
      .get();

  final List<DocumentSnapshot> documents = result.docs;

  return documents.isNotEmpty;
}

class _LoginPageState extends State<LoginPage> {

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // appBar:
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),

                // welcome back, you've been missed!
                Text(
                  'BIENVENUE RENSEIGNER VOTRE MATRICULE \n POUR CONSULTER VOS NOTE !',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                ),

                const SizedBox(height: 15),

                // username textfield
                MyTextField(
                  controller: controller,
                  hintText: 'matricule',
                  obscureText: false,
                ),


                const SizedBox(height: 25),

                // sign in button
                ElevatedButton(
                    onPressed: () async {

                      String documentName = controller.text;
                      if(documentName.length <7 || documentName.length >7 )
                      {
                        EasyLoading.showError('Entrez un matricule valide');
                      }
                      EasyLoading.showProgress(0.3, status: 'checking...');
                      bool documentExists = await doesDocumentExist(documentName);

                      // EasyLoading.showProgress(0.3, status: 'downloading...');
                      //
                      // EasyLoading.showSuccess('Great Success!');
                      //
                      // EasyLoading.showError('Failed with Error');

                      if (documentExists) {
                        EasyLoading.showSuccess('Great Success!\nTu est bien enregistrer');

                      } else {
                        EasyLoading.showError('Ce matricule n\'existe pas');

                      }
                    },
                  child: Text('Login'),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
