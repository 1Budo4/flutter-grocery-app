import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/components/grocery_item_tile.dart';
import 'package:grocery_app/model/cart_model.dart';
import 'package:grocery_app/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String _getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return "Dobro jutro,";
    } else if (hour < 18) {
      return "Dobar dan,";
    } else {
      return "Dobra večer,";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartPage()),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 48),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(_getGreeting(), style: TextStyle(fontSize: 16)),
            ),

            const SizedBox(height: 4),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Naručimo svježe namirnice za Vas",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 24),
            //   child: Divider(thickness: 3),
            // ),
            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text("Svježi proizvodi", style: TextStyle(fontSize: 16)),
            ),

            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemCount: value.shopItems.length,
                  padding: EdgeInsets.all(12),
                  itemBuilder: (context, index) => GroceryItemTile(
                    itemName: value.shopItems[index][0],
                    itemPrice: value.shopItems[index][1],
                    imagePath: value.shopItems[index][2],
                    color: value.shopItems[index][3],
                    onPressed: () => Provider.of<CartModel>(
                      context,
                      listen: false,
                    ).addItemToCart(index),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
