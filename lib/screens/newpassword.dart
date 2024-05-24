import 'package:flutter/material.dart';
import 'package:flutter_application_6/widgets/background-color.dart';
import 'package:flutter_application_6/screens/login.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

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
      title: Padding(
        padding:
         EdgeInsets.symmetric(horizontal: 50,),
         child: Column(
           children: [
           Text('Reset Password',
            style:
             TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold), 
         ),
          ],
      ),
    ),
       ), 

      body: Stack(
        children: [
          BackgroundColor(),
            Padding(
        padding: EdgeInsets.only(left: 25, right: 25, top: 15),
        child: // Add some vertical space between text and line
          Container(
          
            alignment: Alignment.center,
            height: 1, // Height of the line
            color: Colors.black, // Color of the line
          ),),

        SizedBox(height: 30,),
           
        Center(
          child:Column(
            
            mainAxisAlignment:MainAxisAlignment.start ,
           children: [
          
          Image(
            
            image: 
            AssetImage('assets/Mask group (1).png'),
            width: 230,
            ),
            SizedBox(height: 20,),
             Text('Reset your password',
              style:TextStyle(
              fontSize: 16,
               fontWeight: FontWeight.bold,),),
            
             SizedBox(
                height: 55,
              ),
              //form
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color:  Color(0xFFF0EDFF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 18),
                              border: InputBorder.none,
                              hintText: 'New Password',
                               hintStyle:
                                TextStyle(
                                  color: Colors.black),
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                size: 33,
                              ),
                              ),
                                obscureText: true,
                        
                        ),
                      ),
                      SizedBox(
                height: 10,
              ),
              //form
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color:  Color.fromARGB(255, 240, 237, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 18),
                              border: InputBorder.none,
                              hintText: 'Reset New Password',
                               hintStyle:
                                TextStyle(
                                  color: Colors.black),
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                size: 33,
                              ),
                              ),
                                obscureText: true,
                        
                        ),
                      ),
                      SizedBox(height: 80,),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 120,),
                      child: GestureDetector(
                  onTap: () {
                     Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => LoginPage()), // Replace NextScreen() with the screen you want to navigate to
                       );
                      },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(13, 152, 106, 100),
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: Text(
                      'Submit',
                      style:TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              ),
                      
                      
                   ],
        
        
        ),
        
        
        
        ),
        
          
        ],
      ),
        ),
        
        ],
        
        
      ),
        ),
        ],
      ),
    );
  }
}