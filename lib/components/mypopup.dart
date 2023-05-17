import 'package:flutter/material.dart';

class MyPopupDialog extends StatelessWidget {
  final String message;

  const MyPopupDialog({Key? key, required this.message}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Popup Title'),
      content: Text(message),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Do something when the button is pressed
            Navigator.pop(context); // Close the popup dialog
          },
          child: Text('Close'),
        ),
      ],
    );
    throw UnimplementedError();
  }




}
