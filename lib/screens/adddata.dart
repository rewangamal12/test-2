import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController _dateController = TextEditingController();

  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();

  Future<void> _selectDate(TextEditingController controller) async {
    try {
      final DateTime? picked = await showDatePicker(
        context: context,
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
    try {
      final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (picked != null && mounted) {
        final now = DateTime.now();
        final dateTime =
            DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
        setState(() {
          controller.text = picked
              .format(context); // Formats time based on the device's locale
        });
      }
    } catch (e) {}
  }

  String? _selectedValue;

  File? _image;

  final picker = ImagePicker();

  Future getImage() async {
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  String? groupValue = "yes";
  String? temperature = "now";
  String? cleaning = "no";
  @override
  void dispose() {
    _dateController.dispose();

    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

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
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Text(
                  'Plant name',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 18)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Text(
                  'Plant scientefic name',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 18)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Text(
                  'description',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 18)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Text(
                  'Type',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 18)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Text(
                  'Tempreture',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 18)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Text(
                  'Flower color',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 80,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: DropdownButton(
                  hint: Text('Select an option'),
                  value: _selectedValue,
                  items: <String>[
                    'Red',
                    'Yellow',
                    'Green',
                    'Pink',
                    'white',
                    'orange',
                    'Violet',
                    'Blue',
                    'Purple',
                    'Multi Colors'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  icon: Icon(
                    Icons.arrow_downward_rounded,
                    size: 30,
                  ),
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue = newValue;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Text(
                  'Leaf color',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 80,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: DropdownButton(
                  hint: Text('Select an option'),
                  value: _selectedValue,
                  items: <String>[
                    'grey',
                    'Dark green',
                    'Green',
                    'variegated'
                        'white',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  icon: Icon(
                    Icons.arrow_downward_rounded,
                    size: 30,
                  ),
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedValue = newValue;
                    });
                  },
                ),
              ),
              if (_image != null) ...[
                Image.file(_image!),
                SizedBox(height: 20),
              ],
              SizedBox(
                height: 5,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    getImage();
                  },
                  child: Image(
                    image: AssetImage('assets/Mask group44.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        fillColor: Colors.transparent,
                        labelText: 'Date',
                        filled: true,
                        suffixIcon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      readOnly: true,
                      onTap: () {
                        _selectDate(_dateController);
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _startTimeController,
                            decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              labelText: 'Start Date',
                              filled: true,
                              suffixIcon: Icon(Icons.access_time),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            readOnly: true,
                            onTap: () {
                              _selectTime(_startTimeController);
                            },
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: TextField(
                            controller: _endTimeController,
                            decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              labelText: 'End Date',
                              filled: true,
                              suffixIcon: Icon(Icons.access_time),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            readOnly: true,
                            onTap: () {
                              _selectTime(_endTimeController);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Text(
                  'Watering frequency',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 18)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Text(
                  'Fertilizing Frequency',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 18)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Text(
                  'Humidity',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 18)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Text(
                  'Temperature',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 18)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Text(
                  'Light neded to plant',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    RadioListTile(
                        title: Text('Full sun'),
                        value: " Full",
                        groupValue: groupValue,
                        onChanged: (Val) {
                          setState(() {
                            groupValue = Val;
                          });
                        }),
                    RadioListTile(
                        title: Text('Part sun'),
                        value: "Part Sun",
                        groupValue: groupValue,
                        onChanged: (Val) {
                          setState(() {
                            groupValue = Val;
                          });
                        }),
                    RadioListTile(
                        title: Text('Part Shade'),
                        value: "Part shade",
                        groupValue: groupValue,
                        onChanged: (Val) {
                          setState(() {
                            groupValue = Val;
                          });
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Text(
                  'Difficulty',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    RadioListTile(
                        title: Text('Easy'),
                        value: "Easy",
                        groupValue: temperature,
                        onChanged: (Val) {
                          setState(() {
                            temperature = Val;
                          });
                        }),
                    RadioListTile(
                        title: Text('Medium'),
                        value: "Medium",
                        groupValue: temperature,
                        onChanged: (Val) {
                          setState(() {
                            temperature = Val;
                          });
                        }),
                    RadioListTile(
                        title: Text('Hard'),
                        value: "Hard ",
                        groupValue: temperature,
                        onChanged: (Val) {
                          setState(() {
                            temperature = Val;
                          });
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                child: Text(
                  'Cleaning',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    RadioListTile(
                        title: Text('Not needed'),
                        value: " not needed",
                        groupValue: cleaning,
                        onChanged: (Val) {
                          setState(() {
                            cleaning = Val;
                          });
                        }),
                    RadioListTile(
                        title: Text('leaves every third months'),
                        value: " every 3 month",
                        groupValue: cleaning,
                        onChanged: (Val) {
                          setState(() {
                            cleaning = Val;
                          });
                        }),
                    RadioListTile(
                        title: Text('leaves every second month'),
                        value: "every 2 month",
                        groupValue: cleaning,
                        onChanged: (Val) {
                          setState(() {
                            cleaning = Val;
                          });
                        }),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 110,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 43, 165, 120),
                    borderRadius: BorderRadius.circular(16)),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Add data',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
