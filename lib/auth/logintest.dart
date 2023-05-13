import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/my_button.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),

                // welcome back, you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 15),

                // username textfield
                MyTextField(
                  controller: controller,
                  hintText: 'matricule',
                  obscureText: false,
                ),

                //const SizedBox(height: 10),

                // password textfield
                // MyTextField(
                //   controller: controller,
                //   hintText: 'Password',
                //   obscureText: true,
                // ),

                //const SizedBox(height: 5),

                // // forgot password?
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text(
                //         'Forgot Password?',
                //         style: TextStyle(color: Colors.pinkAccent),
                //       ),
                //     ],
                //   ),
                // ),

                const SizedBox(height: 25),

                // sign in button
                ElevatedButton(
                  onPressed: () async {
                    String documentName = controller.text;
                    bool documentExists = await doesDocumentExist(documentName);
                    if (documentExists) {
                      AlertDialog(
                        title: Text('ok c bon sa existe'),
                        content: Text('oui tu existe'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    } else {

                      AlertDialog(
                        title: Text(' c pas bon sa'),
                        content: Text(" tu nexiste pas"),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              },
                      child: Text('Close'),
                          ),
                        ],
                      );

                      // showDialog(
                      //   context: context,
                      //   builder:
                      //    title: Text(' c pas bon sa'),
                      //   content: Text(" tu nexiste pas"),
                      //   actions: [
                      //     ElevatedButton(
                      //       onPressed: () {
                      //         Navigator.pop(context);
                      //       },
                      //       child: Text('Close'),
                      //     ),
                      //   ],
                      //   ,
                      // );
                    }
                  },
                  child: Text('Login'),
                ),

                //const SizedBox(height: 50),

                // or continue with
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Divider(
                //           thickness: 0.5,
                //           color: Colors.pinkAccent,
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //         child: Text(
                //           'Or continue with',
                //           style: TextStyle(color: Colors.pinkAccent),
                //         ),
                //       ),
                //       Expanded(
                //         child: Divider(
                //           thickness: 0.5,
                //           color: Colors.pinkAccent,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                //
                // const SizedBox(height: 30),

                // google + apple sign in buttons
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children:  [
                //     // google button
                //     SquareTile(
                //       onTap: () => AuthService().SignInWithGoogle(),
                //       imagePath: 'lib/images/google.png',
                //     ),
                //
                //     SizedBox(width: 25),
                //
                //     // apple button
                //     SquareTile(
                //         onTap: () => AuthService().SignInWithGoogle(),
                //         imagePath: 'lib/images/apple.png')
                //   ],
                // ),

                // const SizedBox(height: 20),

                // not a member? register now
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Not a member?',
                //       style: TextStyle(color: Colors.grey[700]),
                //     ),
                //     const SizedBox(width: 4),
                //     GestureDetector(
                //       onTap: widget.onTap,
                //       child: const Text(
                //         'Register now',
                //         style: TextStyle(
                //           color: Colors.pinkAccent,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
