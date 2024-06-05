import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_6/screens/PlantScreen.dart';
import 'package:flutter_application_6/screens/Plantdetails.dart';
import 'package:flutter_application_6/widgets/background-color.dart';

class Recommendedplants extends StatelessWidget {
  const Recommendedplants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 50,
            color: Color.fromARGB(255, 5, 77, 59),
            weight: 300,
          ),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Recommended Plants',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 77, 59)),
              ),
              Padding(
        padding: EdgeInsets.only(left: 25, right: 25, top: 15),
        child:
          Container(
          
            alignment: Alignment.center,
            height: 2, // Height of the line
            color: Color.fromARGB(255, 5, 77, 59), // Color of the line
          ),),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildImageContainer(
                      context, 'assets/your_image.png', 'Montesera'),
                  buildImageContainer(
                      context, 'assets/your_image.png', 'Herbs'),
                  buildImageContainer(
                      context, 'assets/your_image.png', 'Flowering Plants'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildImageContainer(
    BuildContext context, String imagePath, String label) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(30),
          color: Color.fromARGB(255, 146, 177, 154),
        ),
        width: 100,
        height: 145,
        child: InkWell(
          onTap: () {
            print('Image tapped!');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Plantscreen()),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      SizedBox(height: 8), // Add space between the image and text
      Text(label , style: TextStyle(fontSize: 15, 
      color: Color.fromARGB(255, 5, 77, 59), 
      fontWeight: FontWeight.bold),),
    ],
  );
}
