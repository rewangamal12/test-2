import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_6/screens/verification.dart';
import 'package:flutter_application_6/widgets/background-color.dart';

class ForgetPassPage extends StatefulWidget {
  const ForgetPassPage({super.key});

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset email sent')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send password reset email: $e')),
      );
    }
  }
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
           Text('Forgot Password',
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
        
       // Add some vertical space between text and line
         Padding(
        padding: EdgeInsets.only(left: 25, right: 25, top: 15),
        child:
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
            AssetImage('assets/Reset Password Icon.png'),
            width: 260,
            ),
             Text('Please enter your email',
              style:TextStyle(
              fontSize: 20,
               fontWeight: FontWeight.bold,),),
          /*   Text('to recieve a verification code',
              style:TextStyle(
                fontSize: 20,
                 fontWeight:
                  FontWeight.bold,
                   color: Colors.black),),*/
             SizedBox(
                height: 25,
              ),
              //form
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color:  Color.fromARGB(255, 240, 237, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 18),
                              border: InputBorder.none,
                              hintText: 'PhoneNumber Or Email',
                               hintStyle:
                                TextStyle(
                                  color: Colors.black),
                              prefixIcon: Icon(
                                Icons.person_outline,
                                size: 33,
                              ),
                              ),
                          
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      SizedBox(height: 80,),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 120,),
                      child: GestureDetector(
                  onTap:_resetPassword,
                      
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(13, 152, 106, 100),
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: Text(
                      'Send',
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
        
      );
    
  }
}