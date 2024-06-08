import 'package:flutter/material.dart';
import 'package:flutter_application_6/screens/AllPlants.dart';
import 'package:flutter_application_6/screens/Reminders.dart';
import 'package:flutter_application_6/widgets/background-color.dart';
import 'package:flutter_application_6/widgets/bottombar.dart';

class AddReminderPage extends StatefulWidget {
  @override
  State<AddReminderPage> createState() => _AddReminderPageState();
}

class _AddReminderPageState extends State<AddReminderPage> {
  int _selectedIndex = 3;

  TextEditingController _dateController = TextEditingController();

  TextEditingController _timeController = TextEditingController();

  TextEditingController _plantNameController = TextEditingController();

  bool _isDatePickerVisible = false;

  bool _isTimePickerVisible = false;

  Future<void> _selectDate(TextEditingController controller) async {
    try {
      final DateTime? picked = await showDatePicker(
        context:context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (picked != null) {
        setState(() {
          controller.text = picked
              .toLocal()
              .toString()
              .split(' ')[0]; // Formats date as yyyy-MM-dd
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _selectTime(TextEditingController controller) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        controller.text = pickedTime.format(context);
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  String? selectedValuePlace;

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
          Positioned(
            top: 320,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isDatePickerVisible = !_isDatePickerVisible;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(88, 187, 128, 100),
                        border: Border.all(
                          color: Color.fromRGBO(88, 187, 128, 100),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_forward_ios),
                          Text(
                            'Select',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            "Date",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_isDatePickerVisible)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          hintText: 'Date',
                          filled: true,
                          suffixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        readOnly: true,
                        onTap: () {
                          _selectDate(_dateController);
                        },
                      ),
                    ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isTimePickerVisible = !_isTimePickerVisible;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(88, 187, 128, 100),
                        border: Border.all(
                          color: Color.fromRGBO(88, 187, 128, 100),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_forward_ios),
                          Text(
                            'Select',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            "Time",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (_isTimePickerVisible)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextField(
                        controller: _timeController,
                        decoration: InputDecoration(
                          fillColor: Colors.transparent,
                          hintText: 'Time',
                          filled: true,
                          suffixIcon: Icon(Icons.access_time_outlined, size: 30,),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        readOnly: true,
                        onTap: () {
                          _selectTime(_timeController);
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        
          Positioned(
            top: 240,
            left: 0,
            right: 0,
            child: Center(
              child:Container(
                  width: 390, // يمكنك تغيير القيمة لتحديد العرض المناسب
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(88, 187, 128, 100),
                    border: Border.all(
                      color: Color.fromRGBO(88, 187, 128, 100),
                      width: 2,
                    ),
              
                ),
                child: DropdownButtonFormField<String>(
                  
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w800),
                  hint: selectedValuePlace == null
                      ? Container(
                      child: Text(
                        "Plant Name",
                        
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ))
                      : Container(
                    child: Text(
                      "${selectedValuePlace.toString()}",
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  isExpanded: true,
                  items: <String>[
                   "",
                   ""
                  ]
                      .map(
                        (value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                      .toList(),
                  borderRadius: BorderRadius.circular(10),
                  menuMaxHeight: 260,
                  onChanged: (valueSelcet) async {
                    selectedValuePlace = valueSelcet;
                    print(selectedValuePlace);
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 580,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ReminderPage();
                          },
                        )
                        );
                      // تنفيذ أي شيء تحتاجه عند النقر على السهم
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(88, 187, 128, 100),
                        border: Border.all(
                          color: Color.fromRGBO(88, 187, 128, 100),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Set reminder',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 5, 77, 59),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

               /*Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: 390, // يمكنك تغيير القيمة لتحديد العرض المناسب
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(88, 187, 128, 100),
                    border: Border.all(
                      color: Color.fromRGBO(88, 187, 128, 100),
                      width: 2,
                    ),
                  ),
                  child: TextField(
                    controller: _plantNameController,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      hintText: 'Plant Name',
                      filled: true,
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),*/
            
          /*Positioned(
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
                        ));
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
                            return ReminderPage();
                          },
                        ));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 240,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // تنفيذ أي شيء تحتاجه عند النقر على السهم
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 135, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(88, 187, 128, 100),
                        border: Border.all(
                          color: Color.fromRGBO(88, 187, 128, 100),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_forward_ios),
                          Text(
                            'Select',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 5, 77, 59),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 295,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // تنفيذ أي شيء تحتاجه عند النقر على السهم
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(88, 187, 128, 100),
                        border: Border.all(
                          color: Color.fromRGBO(88, 187, 128, 100),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_forward_ios),
                          Text(
                            'Select',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 5, 77, 59),
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            "Remind Me About",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 5, 77, 59),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 355,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // تنفيذ أي شيء تحتاجه عند النقر على السهم
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 62, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(88, 187, 128, 100),
                        border: Border.all(
                          color: Color.fromRGBO(88, 187, 128, 100),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_forward_ios),
                          Text(
                            'Select',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 5, 77, 59),
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            "Repeat Every",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 5, 77, 59),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 415,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // تنفيذ أي شيء تحتاجه عند النقر على السهم
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 104, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(88, 187, 128, 100),
                        border: Border.all(
                          color: Color.fromRGBO(88, 187, 128, 100),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_forward_ios),
                          Text(
                            'Select',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 5, 77, 59),
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            "Time",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 5, 77, 59),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 475,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // تنفيذ أي شيء تحتاجه عند النقر على السهم
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 77, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(88, 187, 128, 100),
                        border: Border.all(
                          color: Color.fromRGBO(88, 187, 128, 100),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_forward_ios),
                          Text(
                            'Select',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 5, 77, 59),
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            "Previously",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 5, 77, 59),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 540,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // تنفيذ أي شيء تحتاجه عند النقر على السهم
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(88, 187, 128, 100),
                        border: Border.all(
                          color: Color.fromRGBO(88, 187, 128, 100),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Set reminder',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 5, 77, 59),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),*/
          
        ],
      ),
      
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  
}



