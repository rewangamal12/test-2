import 'package:flutter/material.dart';
import 'package:flutter_application_6/screens/Searchbar.dart';
import 'package:flutter_application_6/screens/adddata.dart';
import 'package:flutter_application_6/widgets/background-color.dart';

class Outdoorplants extends StatefulWidget {
  const Outdoorplants({super.key});

  @override
  State<Outdoorplants> createState() => _OutdoorplantsState();
}

class _OutdoorplantsState extends State<Outdoorplants> {
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
                        'Outdoor plants',
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