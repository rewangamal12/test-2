import 'package:flutter/material.dart';
import 'package:flutter_application_6/main.dart';
import 'package:flutter_application_6/screens/Shoppingcart.dart';
import 'package:flutter_application_6/widgets/background-color.dart';

class CheckoutPage extends StatelessWidget {
  final List<Product> cartItems;

  CheckoutPage({required this.cartItems});
  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(0, (sum, item) => sum + item.price);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
          size: 40,
            color: Color.fromARGB(255, 5, 77, 59),
            weight: 300,),
          onPressed: () {
            
            Navigator.pop(context);
          },
        ),
        title: 
              Text(
                'Checkout',
                style: TextStyle(
                  color: ( Color.fromARGB(255, 5, 77, 59)),
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
            
          
        
        centerTitle: true,
        actions: <Widget>[
          Container(
          padding: EdgeInsets.all(1),
          child: Image.asset('assets/logo1.png'),
        ),
        ],
      ),
      body: Stack(
        children: [
          BackgroundColor(),
      Padding(
          padding: const EdgeInsets.all(16.0),
        
        child:
        
         Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            Text(
              'Shipping Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20), // إضافة مسافة بين النص وحقل الإدخال
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), // زيادة التدوير هنا
                border: Border.all(color: Color.fromRGBO(178, 204, 195, 80)),
                color: Color.fromRGBO(178, 204, 195, 80)
                    .withOpacity(0.1), // تغيير لون الحدود هنا
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person,
                        color: Color.fromRGBO(
                            5, 77, 59, 100)), // تغيير لون الأيقونة هنا
                    labelText: 'Full Name',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(
                            5, 77, 59, 100)), // تغيير لون نص العنوان هنا
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10), // إضافة مسافة بين حقول الإدخال
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), // زيادة التدوير هنا
                border: Border.all(color: Color.fromRGBO(178, 204, 195, 80)),
                color: Color.fromRGBO(178, 204, 195, 80)
                    .withOpacity(0.1), // تغيير لون الحدود هنا
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.location_on,
                        color: Color.fromRGBO(
                            5, 77, 59, 100)), // تغيير لون الأيقونة هنا
                    labelText: 'Address',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(
                            5, 77, 59, 100)), // تغيير لون نص العنوان هنا
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10), // إضافة مسافة بين حقول الإدخال
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), // زيادة التدوير هنا
                border: Border.all(color: Color.fromRGBO(178, 204, 195, 80)),
                color: Color.fromRGBO(178, 204, 195, 80)
                    .withOpacity(0.1), // تغيير لون الحدود هنا
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone,
                        color: Color.fromRGBO(
                            5, 77, 59, 100)), // تغيير لون الأيقونة هنا
                    labelText: 'Phone',
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(
                            5, 77, 59, 100)), // تغيير لون نص العنوان هنا
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // إضافة مسافة بين حقول الإدخال
            Text(
              'Order', // النص الذي تريد عرضه بعد الحقل
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                  ),
            ),
            SizedBox(height: 10,),
            Expanded(
              
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(cartItems[index].name),
                    subtitle: Text('\$${cartItems[index].price.toStringAsFixed(2)}'),
                    
                  );
                  
                  
                },
                ),
          
              ),
              SizedBox(height: 10), // Adding space between ListView.builder and total
            Text(
              'Total: \$${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color:Color.fromARGB(255, 5, 77, 59)
              ),
            ),
              
            
            
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
                                      'Confirm',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    )
                                    )
                                    ),
                                    ),
          ],
                                )
                  )
        ],
      ),
                );
          
        
  }
}
