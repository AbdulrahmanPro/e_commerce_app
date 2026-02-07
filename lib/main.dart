import 'package:e_commerce/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/views/pages/cart_screen.dart';
import 'package:e_commerce/views/pages/profile_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

void main() => runApp(CustomBottomNavBar());

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Bottom Navigation Bar Demo',
      debugShowCheckedModeBanner: false,

      home: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: HomePage(),
            item: ItemConfig(icon: Icon(Icons.home), title: "Home"),
          ),
          PersistentTabConfig(
            screen: CartScreen(),
            item: ItemConfig(icon: Icon(Icons.shopping_cart), title: "Cart"),
          ),
          PersistentTabConfig(
            screen: ProfileScreen(),
            item: ItemConfig(icon: Icon(Icons.person), title: "Profile"),
          ),
        ],
        navBarBuilder: (navBarConfig) =>
            Style8BottomNavBar(navBarConfig: navBarConfig),
      ),
    );
  }
}
