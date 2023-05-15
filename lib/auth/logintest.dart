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
      .where(FieldPath.documentId, isEqualTo: documentName)
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
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("mark_manager",
                    style: TextStyle(color: Colors.pinkAccent),textAlign:  TextAlign.center,
                    ),
      ),
      backgroundColor: Colors.blue[50],
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
                  'BIENVENUE \n RENSEIGNER VOTRE MATRICULE \n POUR CONSULTER VOS NOTE !',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 18,
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
                        EasyLoading.showError('Entrez un matricule valide',duration: Duration(seconds: 3),);
                      }
                      EasyLoading.show(status: 'checking...');
                      bool documentExists = await doesDocumentExist(documentName);

                      // EasyLoading.showProgress(0.3, status: 'downloading...');
                      //
                      // EasyLoading.showSuccess('Great Success!');
                      //
                      // EasyLoading.showError('Failed with Error');

                      if (documentExists) {
                        EasyLoading.showSuccess('Great Success!\nTu est bien enregistrer');

                      } else {
                        EasyLoading.showError('Ce matricule n\'est pas enregistrer');

                      }
                    },
                  child: Text('Login',
                              style: TextStyle(color: Colors.pinkAccent ),
                          ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
