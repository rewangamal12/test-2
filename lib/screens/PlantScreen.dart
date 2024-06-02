import 'package:flutter/material.dart';
import 'package:flutter_application_6/widgets/background-color.dart';

class Plantscreen extends StatelessWidget {
  const Plantscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Column(
          children: [
            Stack(
              
              children: [
              
                Container(
                  color: Color(0xff8fd0ac), // Mint Green
                  height: MediaQuery.of(context).size.height *
                      0.4, // Adjust height as needed
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      Image.asset(
                        'assets/your_image.png', // Replace 'your_image.png' with your image file path
                        width: 200, // Adjust width as needed
                        height: 200, // Adjust height as needed
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 5,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, 
           size: 50, 
           color:  Color.fromARGB(255, 5, 77, 59),
           weight:300,),
                    onPressed: () {
                        Navigator.pop(context);// Add your back navigation logic here
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffd6f2df), Color(0xffbdeac4)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                alignment: Alignment.topLeft, // Align text to top left
                padding: EdgeInsets.only(left: 20, top: 10), // Adjust padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Monstera',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000000),
                      ),
                    ),
                    Text(
                      'Indoor',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff979595),
                      ),
                    ),
                    SizedBox(height: 5), // Spacer between text and divider
                    SizedBox(
                      height: 2, // Adjust height of the divider
                      width: 320, // Adjust width of the divider
                      child: Divider(
                        color: Color(0xff818181), // Adjust color of the divider
                      ),
                    ),
                    SizedBox(
                        height: 10), // Spacer between divider and About text
                    Text(
                      'About',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000000),
                      ),
                    ),
                    SizedBox(
                        height:
                            35), // Spacer between About text and new text field
                    SizedBox(height: 5), // Spacer between text and divider
                    SizedBox(
                      height: 2, // Adjust height of the divider
                      width: 320, // Adjust width of the divider
                      child: Divider(
                        color: Color(0xff818181), // Adjust color of the divider
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 6,
                          left: 6), // Adjust the values for desired position
                      child: DraggableBoxes(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    
  }
}
class DraggableBoxes extends StatefulWidget {
  @override
  _DraggableBoxesState createState() => _DraggableBoxesState();
}

class _DraggableBoxesState extends State<DraggableBoxes> {
  List<Offset> positions = [Offset(0, 0), Offset(0, 0), Offset(0, 0)];
  List<Color> boxColors = [
    Color(0xff919a9a),
    Color(0xff919a9a),
    Color(0xff919a9a)
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(3, (index) {
        return Transform.translate(
          offset: positions[index],
          child: Draggable<int>(
            data: index,
            feedback: buildBox(index, Colors.grey.withOpacity(0.5)),
            child: DragTarget<int>(
              onAccept: (receivedIndex) {
                setState(() {
                  // Swap the positions of the boxes
                  Offset temp = positions[index];
                  positions[index] = positions[receivedIndex];
                  positions[receivedIndex] = temp;
                });
              },
              builder: (context, acceptedData, rejectedData) {
                return GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      positions[index] +=
                          Offset(details.delta.dx - 10, details.delta.dy - 10);
                    });
                  },
                  child: buildBox(index, boxColors[index]),
                );
              },
            ),
            childWhenDragging: buildBox(index, Colors.transparent),
          ),
        );
      }),
    );
  }

  Widget buildBox(int index, Color color) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color, // Adjust color as needed
        borderRadius: BorderRadius.circular(10), // Adjust radius as needed
      ),
    );
  }
}