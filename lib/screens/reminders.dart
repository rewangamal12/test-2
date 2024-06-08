import 'package:flutter/material.dart';
import 'package:flutter_application_6/screens/Addreminder.dart';
import 'package:flutter_application_6/screens/AllPlants.dart';
import 'package:flutter_application_6/widgets/background-color.dart';
import 'package:flutter_application_6/widgets/bottombar.dart';


class ReminderPage extends StatefulWidget {
  const ReminderPage({super.key});
  

  @override
  State<ReminderPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<ReminderPage> {
  int _selectedIndex = 3;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundColor(),
          // تركيب الصورة في أعلى الصفحة
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/logo1.png', // قم بتغيير هذا بمسار واسم ملف الصورة الخاص بك
                width: 170,
                height: 170,
              ),
            ),
          ),
          // اضافه كلمه
          Positioned(
            top: 110, // تحديد الارتفاع من الأعلى
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'My Garden',
                style: TextStyle(
                    fontSize: 46,
                    //fontFamily: 'Arial',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 77, 59)),
              ),
            ),
          ),
          Positioned(
            top: 180, // تحديد الارتفاع من الأعلى
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromRGBO(88, 187, 128, 100), // حدود مستديرة
                      border: Border.all(
                        color: Color.fromRGBO(88, 187, 128, 100), // لون الحدود
                        width: 2, // سمك الحدود
                      ),
                    ),
                    child: TextButton(
                      child: Text(
                        'All Plants',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return AllPlantsPage();
                          },
                        )
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 5), // مسافة بين العناصر
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromRGBO(88, 187, 128, 100),
                      border: Border.all(
                        color: Color.fromRGBO(88, 187, 128, 100), // لون الحدود
                        width: 2, // سمك الحدود
                      ),
                    ),
                    child: TextButton(
                      child: Text(
                        'Reminders',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return (ReminderPage());
                          },
                        )
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),  
      floatingActionButton: InkResponse(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return AddReminderPage();
                          },
                        )
                        );
        },
        child: 
      Card(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Color.fromRGBO(88, 187, 128, 100),
        child: Icon(
          Icons.add_outlined,
          color: Colors.white,
          size: 80,
        ),
      ),
      ),
        bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),

    );
  }
}