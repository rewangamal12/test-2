import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/screens/Addpost.dart';
import 'package:flutter_application_6/screens/PlantScreen.dart';
import 'package:flutter_application_6/screens/Plants.dart';
import 'package:flutter_application_6/screens/adddata.dart';
import 'package:flutter_application_6/screens/login.dart';
import 'package:flutter_application_6/screens/profilepicture.dart';
import 'package:flutter_application_6/widgets/background-color.dart';
//import 'package:flutter_application_6/screens/signup.dart';
//import 'package:flutter_application_6/screens/constants.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_6/widgets/image_slider.dart';

import 'package:flutter_application_6/widgets/bottombar.dart';
import 'package:flutter_application_6/screens/Searchbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  FirebaseAuth instance = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    instance.authStateChanges().listen((User? user) {
      // Changed to User?
      if (user == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        // Handle the case where the user is not null, if necessary
      }
    });
  }
  //const HomePage({super.key});

  // Define the pages to be displayed in each tab
  final List<Widget> _pages = [
    Placeholder(), // Example page 1
    Placeholder(), // Example page 2
    Placeholder(), // Example page 3
  ];

  // Handle tap on bottom navigation bar items
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Color(0xFF58BB80),

      appBar: AppBar(
        elevation: 0.0,
        leading: Container(
          padding: EdgeInsets.all(1),
          child: Image.asset('assets/logo1.png'),
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
          Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: Color.fromARGB(255, 5, 77, 59),
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer(); // Open the end drawer
              },
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        backgroundColor: Color(0xFF054D3B),
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                //Navigate to another page when the ListTile is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePicure()),
                );
                // Handle tap on Settings
              },
              child: ListTile(
                leading: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.white,
                ),
                title: Text('My Account',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            GestureDetector(
              onTap: () {
                //Navigate to another page when the ListTile is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Plantscreen()),
                );
                // Handle tap on Settings
              },
              child: ListTile(
                leading: Icon(
                  Icons.post_add,
                  color: Colors.white,
                ),
                title: Text(
                  'Post',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            
            ListTile(
              leading: Icon(
                Icons.people_alt,
                color: Colors.white,
              ),
              title: Text('Community',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () {
                // Handle tap on Settings
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: Text('Settings',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onTap: () {
                // Handle tap on Settings
              },
            ),
            GestureDetector(
              onTap: () {
                instance.signOut();
                //Navigate to another page when the ListTile is tapped
              //  Navigator.push(
              //    context,
              //    MaterialPageRoute(builder: (context) => LoginPage()),
              //  );
                // Handle tap on Settings
              },
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text('Log Out',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ),
            // Add more ListTiles for additional sidebar items
          ],
        ),
      ),

      body: Stack(
        children: [
          BackgroundColor(),
          SingleChildScrollView( 
            child: 
          Positioned.fill(
              child: Container(
                  margin: EdgeInsets.all(9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome UserName !',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 5, 77, 59),
                        ),
                      ),
                      Text(
                        'Take care of your plant',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 5, 77, 59),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ImageSlider(imageUrls: [
                        'https://hips.hearstapps.com/hmg-prod/images/jade-plant-1-645157c445e14.jpg?crop=1.00xw:0.829xh;0,0&resize=1200:*',
                        'https://www.ikea.com/ca/en/images/products/fejka-artificial-potted-plant-indoor-outdoor-monstera__0614197_pe686822_s5.jpg',
                        'https://www.shutterstock.com/image-photo/young-schefflera-potted-plant-isolated-260nw-526198357.jpg',
                      ]),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Categories',
                        style: TextStyle(
                          color: Color.fromARGB(255, 5, 77, 59),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10,),
                      
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildImageContainer(context, 'assets/your_image.png', 'Ferns'),
                        buildImageContainer(context, 'assets/your_image.png', 'Herbs'),
                        buildImageContainer(context, 'assets/your_image.png', 'Flowering Plants'),
                    ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildImageContainer(context, 'assets/your_image.png', 'Ferns'),
                        buildImageContainer(context, 'assets/your_image.png', 'Herbs'),
                        buildImageContainer(context, 'assets/your_image.png', 'Flowering Plants'),
                    ],
                    ),
                      
                      
                      Text(
                        'Diseases',
                        style: TextStyle(
                          color: Color.fromARGB(255, 5, 77, 59),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      Text(
                        'Articles and care guide',
                        style: TextStyle(
                          color: Color.fromARGB(255, 5, 77, 59),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ))
          ),
          ),
        ],
      ),

      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
Widget buildImageContainer(BuildContext context, String imagePath, String label) {
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
                MaterialPageRoute(builder: (context) => Plants()),
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

