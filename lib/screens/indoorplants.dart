import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/screens/Addpost.dart';
import 'package:flutter_application_6/screens/PlantScreen.dart';
import 'package:flutter_application_6/screens/Plantdetails.dart';
import 'package:flutter_application_6/screens/indoorplants.dart';
import 'package:flutter_application_6/screens/adddata.dart';
import 'package:flutter_application_6/screens/login.dart';
import 'package:flutter_application_6/screens/profilepicture.dart';
import 'package:flutter_application_6/widgets/background-color.dart';

import 'package:flutter_application_6/screens/Searchbar.dart';




class indoorPlants extends StatefulWidget {
  const indoorPlants({super.key});

  @override
  State<indoorPlants> createState() => _PlantsState();
}

class _PlantsState extends State<indoorPlants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        elevation: 0.0,
        leading:IconButton(
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
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
              color: Color.fromARGB(255, 5, 77, 59),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
          IconButton(
              onPressed: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddData()),
              );
              },
              icon: Icon(
                Icons.notifications_outlined,
                size: 30,
                color: Color.fromARGB(255, 5, 77, 59),
              )),
              Container(
          padding: EdgeInsets.all(1),
          child: Image.asset('assets/logo1.png'),
        ),
          
        ],
      ),
      
      body:  Stack(
        children: [
          BackgroundColor(),
          SingleChildScrollView( 
            child:Positioned.fill(
              child: Container(
                  margin: EdgeInsets.all(9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Indoor plants',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 5, 77, 59),
                        ),
                      ),
                      SizedBox(height: 10,),
                      
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Container(
                                      
                                        decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(30),
                                        color:Color.fromARGB(255, 146, 177, 154),
                                      ),
                                      width: 100,
                                      height: 145,
                                      child: InkWell(
                                        onTap: () {
                                          print('Image tapped!');
                                          
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.asset(
                                            'assets/your_image.png', 
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      
                                    ),
                                    SizedBox(height: 8), // Space between the image and the text
                                    Text(
                                          'Plant name',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 5, 77, 59),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                               ),
                                      ),
                                    
                              ],
                            ),
                                Column(
                                  children: [
                                    Container(
                                      
                                                            decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(30),
                                        color:Color.fromARGB(255, 146, 177, 154),
                                      ),
                                      width: 100,
                                      height: 145,
                                      child: InkWell(
                                        onTap: () {
                                          print('Image tapped!');
                                          
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child: Image.asset(
                                            'assets/your_image.png', 
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      
                                    ),
                                    SizedBox(height: 8), // Space between the image and the text
                                    Text(
                                          'Plant name',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 5, 77, 59),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                               ),
                                      ),
                                  ],
                                ),
                              
                          ],
                        ),
                          
                      
                      ],
                      
                    ),
                    ],
                  ),
          ),
            ),
          ),  
        ],
      
      
      ),
    );
  }
}
Widget buildImageContainer(BuildContext context, String imagePath,
 String label,String title , String description) {
    return Column(
      children: [
        Container(
          
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(30),
            color:Color.fromARGB(255, 146, 177, 154),
          ),
          width: 100,
          height: 145,
          child: InkWell(
            onTap: () {
              print('Image tapped!');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlantDetailScreen(
                    title: title,
                    description: description,
                    imagePath: imagePath,
                  ),
                ),
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
        Text(label),
      ],
    );
  }
