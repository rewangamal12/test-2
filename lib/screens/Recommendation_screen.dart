import 'package:flutter/material.dart';
import 'package:flutter_application_6/widgets/background-color.dart';
import 'package:flutter_application_6/widgets/outlinedbutton.dart';

class Recommendation extends StatelessWidget {
  const Recommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: IconButton(
        icon:Icon(Icons.arrow_back_ios, 
           size: 50, 
           color:  Color.fromARGB(255, 5, 77, 59),
           weight:300, ),
           onPressed: () {
        Navigator.pop(context); // Navigate back
      },
        ),
    actions: [
      Image.asset('assets/logo1.png'),
    ],
    ),
    
    body: Stack(
      children: [
        BackgroundColor(),
        Padding(padding: EdgeInsets.only(left: 10, top: 18,right: 10),
        child: Container(
          child: Text('WHAT ARE YOU INTERESTED IN ?',
           style:
            TextStyle(
              fontSize: 23,
               fontWeight: FontWeight.bold,
               ),
               ),
        ),
          ),
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Level of Plants
          
          ],
      ),
      
      ],
    ),
    );
  }
}