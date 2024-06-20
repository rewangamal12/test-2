import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_6/widgets/background-color.dart';

import '../../model/get_data_home.dart';
import 'Checkout.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  int? price;
  int?  totalPriceFinal;
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.arrow_back,
            size: 40,
            color:Color.fromARGB(255, 5, 77, 59),
            weight: 300,),
          onPressed: () {

            Navigator.pop(context);
          },
        ),
          title: Center(
            child: Text(
              'Shopping Cart',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF054D3B),
              ),
            ),
          ),

        ),
        body: Center(
          child: Text('Please log in to see your cart.'),
        ),

      );
    }

    return  StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('ShoppingCart')
            .doc(user.email)
            .collection('Items')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          var documents = snapshot.data?.docs ?? [];

          if (documents.isEmpty) {
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
              title:Center(
                child: Text(
                  "Shopping cart",
                  style: TextStyle(
                    
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF054D3B),
                  ),
                ),
              ),
              
              actions: [
      Image.asset('assets/logo1.png'),
    ],
              ),
            
          
            body: Center(
               child:
                
              Container(
              height: MediaQuery.of(context).size.height / 1,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
            colors: [Colors.white, Color(0xffbdeac4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            
          ),
              ),
              child: Center(
                child:
                     Text(
                  "Your cart is empty",
                  style: TextStyle(
                    fontSize: 24,
                    color:  Color.fromARGB(255, 5, 77, 59),
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ),
            ),
            
            );
          }
          List<ProductCart> productsBySection = documents.map((doc) {
            var data = doc.data() as Map<String, dynamic>;
            price = int.parse(data['price']);
            print('Price from document: $price');
            return ProductCart.fromJson(data);
          }).toList();

// Calculate the total price
          totalPriceFinal = productsBySection.fold(0, (sum, product) => sum! + price!);
          print('Total Price: $totalPriceFinal');

          return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(
                  'Shopping Cart',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF054D3B),
                  ),
                ),
              ),
            ),
            body:Stack(
              children: [
              
                BackgroundColor(),
                if (productsBySection.isNotEmpty)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFF054D3B),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Text(
                      'You have ${productsBySection.length} items in your cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ListView.builder(
                  padding: EdgeInsets.only(top: productsBySection.isNotEmpty ? 70 : 20),
                  itemCount: productsBySection.length,
                  itemBuilder: (context, index) {
                    var product = productsBySection[index];
                    return ListTile(
                      title: Text(product.planetName.toString()),
                      subtitle: Text('\$${product.plantPricing.toString()}'),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_shopping_cart, color: Color(0xFF054D3B)),
                        onPressed: () => _removeFromCart(product, user.email!),
                      ),
                    );
                  },
                ),
              ],
            ),

            bottomNavigationBar: BottomAppBar(
            
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Total: \$${totalPriceFinal!.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    color: Color(0xFF054D3B)
                    ),
                    child: GestureDetector(

                      onTap: () async {
                        // Create a collection 'Complete Order' and add the items and total price
                        CollectionReference completeOrderRef =
                        FirebaseFirestore.instance
                            .collection('ShoppingCart')
                            .doc(FirebaseAuth
                            .instance.currentUser!.email)
                            .collection("checkout");
                        await completeOrderRef.add({
                          'items': documents.map((doc) => doc.data()).toList(),
                          'totalPrice': totalPriceFinal,
                          // Add any other relevant data
                        });

                        // Navigate to the Checkout screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckoutPage()),
                        );
                      },
                      child: Text('Complete Order', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          );
        },
      );

  }

  void _removeFromCart(ProductCart product, String userEmail) {
    FirebaseFirestore.instance
        .collection('ShoppingCart')
        .doc(userEmail)
        .collection('Items')
        .where('planetName', isEqualTo: product.planetName)
        .get()
        .then((snapshot) {
      snapshot.docs.first.reference.delete();
    });
  }
}



