import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_6/widgets/background-color.dart';
import 'package:flutter_application_6/widgets/outlinedbutton.dart';

class Recommendation extends StatefulWidget {
  const Recommendation({super.key});

  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
    final List<Question> _questions = <Question>[
    Question(
      text: 'SUN',
      options: [
        'full sun, part sun, part shade',
        'full sun , part sun',
        'part shade, part sun',
        'full sun'
      ],
    ),
      Question(text: 'Place', options: ['Indoor', 'Outdoor']),
    Question(text: 'PLANT DIFFICULTY', options: ['Easy', 'Medium', 'Hard']),
    /*Question(text: 'WATERING', options: [
      'water every (1 to 7) days',
      'water every (8 to 14) days',
      'water every more than 14 day'
    ]),
    Question(text: 'FERTILIZING', options: [
      'Not needed',
      'during 1st or 2st week',
      'during 3st or 4st week',
      'more than month'
    ]),
    Question(text: 'HUMUDITY', options: ['Not needed', 'normal', 'High']),
    Question(text: 'CLEAN', options: [
      'Not needed',
      'leaves every second month',
      'leaves every third month'
    ]),*/
    Question(text: 'FLOWER_COLOR', options: [
      'red, pink, yellow',
      'white,pink,purple',
      'green',
      'pink,white',
      'green,white',
      'white',
      'Violet',
      'Violet,blue',
      'RED, pink, orange',
      'orange',
      'Yellow',
      'pink',
      'red',
      'Multi color'
    ]),
  ];

  final Map<int, String?> _selectedOptions = {};
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
        child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'WHAT ARE YOU INTERESTED IN?',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold , color:Color.fromARGB(255, 5, 77, 59)),
            ),
          ),
          ..._questions.asMap().entries.map((entry) {
            int index = entry.key;
            Question question = entry.value;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        question.text,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      DropdownButton<String>(
                        isExpanded: true,
                        hint: Text('Choose'),
                        value: _selectedOptions[index],
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedOptions[index] = newValue;
                          });
                        },
                        items: question.options.map((String option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              
            );
          }).toList(),
          
                SizedBox(height: 10),
                Center(
                  child: Container(
                      height: 50,
                          width: 110,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 43, 165, 120),
                      borderRadius: BorderRadius.circular(16)),
                    child: TextButton(
                      onPressed: (){},
                       child: Text(
                                      'Submit',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    )
                                    )
                                    ),
                                    ),
        ],
        
      ),
      
          ),
        
      ],
    )
    
    );
  }
}

class Question {
  final String text;
  final List<String> options;

  Question({required this.text, required this.options});
}
          

    
    