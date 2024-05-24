import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_6/main.dart';
import 'package:flutter_application_6/widgets/background-color.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<Product> _cartItems = [];
  double _totalPrice = 0;

  void _addToCart(Product product) {
    setState(() {
      _cartItems.add(product);
      _totalPrice += product.price;
    });
  }

  void _removeFromCart(Product product) {
    setState(() {
      _cartItems.remove(product);
      _totalPrice -= product.price;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        actions: [
          FloatingActionButton(
            onPressed: () {
              // Simulate adding a product to the cart
              _addToCart(Product('Product ${_cartItems.length + 1}', 10));
            },
            backgroundColor: Colors.white, // Background color of the button
            foregroundColor: Color(0xFF054D3B), // Color of the icon
            elevation: 0.0,
            child: Icon(
              Icons.shopping_cart_checkout_outlined,size: 30,
              color: Color(0xFF054D3B),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          BackgroundColor(),
          if (_cartItems.isNotEmpty)
          Container(
            
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              
              color:  Color(0xFF054D3B),
              shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(23)
              
              
            ),
            
            child: Text('you have ${_cartItems.length} Items in your cart',
             style: TextStyle(color: Colors.white),),
            
          ),
          ListView.builder(
            padding: EdgeInsets.only(top:_cartItems.isNotEmpty ? 70 : 20, ),
            itemCount: _cartItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_cartItems[index].name),
                subtitle:
                    Text('\$${_cartItems[index].price.toStringAsFixed(2)}'),
                trailing: IconButton(
                  icon: Icon(Icons.remove_shopping_cart, color:Color(0xFF054D3B) ,),
                  onPressed: () => _removeFromCart(_cartItems[index]),
                ),
              );
            },
          ),
        ],
      ),
      
         bottomNavigationBar: _cartItems.isNotEmpty ?
         
          BottomAppBar(
        
        child:
         Padding(
          padding: const EdgeInsets.all(16.0),
          
          child: Text(
            'Total: \$${_totalPrice.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20),
          ),
        ),
      )
      : null,
    
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
