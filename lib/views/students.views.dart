import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentsDetails extends StatefulWidget {
  final String matricule;
  const StudentsDetails({Key? key, required this.matricule}) : super(key: key);

  @override
  State<StudentsDetails> createState() => _StudentsDetailsState();
}

class _StudentsDetailsState extends State<StudentsDetails> {


   String nom = '';
   String prenom = '';
  String matriculeRecherche = '';
  late Map<String, dynamic> notes = {};

  @override
  void initState() {
    setState(() {
      matriculeRecherche = widget.matricule.toString();
    });
    print(matriculeRecherche);
    getStudents();
    super.initState();
  }


  Future<DocumentSnapshot<Map<String, dynamic>>> getEtudiantByMatricule(String matricule) async {
    DocumentSnapshot<Map<String, dynamic>> etudiantSnapshot =
    await FirebaseFirestore.instance.collection('etudiants').doc(matricule).get();

    return etudiantSnapshot;
  }


  void getStudents() async {
    setState(() {
      matriculeRecherche;
    });
    Future<DocumentSnapshot<Map<String, dynamic>>> etudiantSnapshot =
    getEtudiantByMatricule(matriculeRecherche);

     etudiantSnapshot.then((etudiant) {
       if (etudiant.exists) {
         Map<String, dynamic>? data = etudiant.data();
         if (data != null && data is Map<String, dynamic>) {
           nom = data['nom'] ?? '';
           prenom = data['prenom'] ?? '';
           notes = data['note'] ?? {};
           setState(() {
               nom;
               prenom;
               notes;
             });
             print(nom + " " + prenom);
             print(notes);
         }
       } else {
         print('Aucun étudiant trouvé pour le matricule $matriculeRecherche');
       }
     }).catchError((error) {
       print('Erreur lors de la récupération de l\'étudiant: $error');
     });
  }


  @override
  Widget build(BuildContext context) {
    double average = calculateAverage();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails de l\'étudiant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$nom $prenom',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Matricule: $matriculeRecherche',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Notes:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Table(
              children: [
                _buildTableRow('ICT202', notes['ICT202'].toString()),
                _buildTableRow('ICT204', notes['ICT204'].toString()),
                _buildTableRow('ICT206', notes['ICT206'].toString()),
                _buildTableRow('ICT208', notes['ICT208'].toString()),
                _buildTableRow('ICT210', notes['ICT210'].toString()),
                _buildTableRow('ICT218', notes['ICT218'].toString()),
                // Ajoutez les autres matières en fonction de votre structure de données
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              'MGP $average' ,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

   double calculateAverage() {
     if (notes.isNotEmpty) {
       final total = notes.values.fold(0.0, (sum, note) => sum + num.parse(note));
       print(total);
       return (total /notes.length)/20;
     }
     return 0.0;
   }





   TableRow _buildTableRow(String ue, String note) {
    return TableRow(
        children: [
    TableCell(
    child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
    ue,
    style: const TextStyle(fontSize: 16.0),
    ),
    ),
    ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                note,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
    );
  }
}


