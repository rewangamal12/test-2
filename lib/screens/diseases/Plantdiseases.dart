import 'package:flutter/material.dart';

class PlantDiseasesScreen extends StatelessWidget {
  final String label;
  final String description;
  final String imagePath;

  PlantDiseasesScreen(
      {required this.label,
      required this.description,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xffbdeac4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 1,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              children: [
                Container(
                  // Adjust height as needed
                  alignment: Alignment.center,
                  child: Image.asset(imagePath),
                ),
                Positioned(
                  top: 30,
                  left: 5,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 50,
                      color: Color.fromARGB(255, 5, 77, 59),
                      weight: 300,
                    ),
                    onPressed: () {
                      Navigator.pop(
                          context); // Add your back navigation logic here
                    },
                  ),
                ),
              ],
            ),
            Container(
                alignment: Alignment.topLeft, // Align text to top left
                padding: EdgeInsets.only(left: 20, top: 10), // Adjust padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          label,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 77, 59),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2, // Adjust height of the divider
                      width: 320, // Adjust width of the divider
                      child: Divider(
                        color: Color(0xff818181), // Adjust color of the divider
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000000),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff979595),
                      ),
                    ),
                  ],
                )),
          ],
        )),
      ),
    );
  }
}
