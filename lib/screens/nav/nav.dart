import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itb_cafeteria_consumer/screens/cart/cart.dart';
import 'package:itb_cafeteria_consumer/screens/home/home.dart';
import 'package:itb_cafeteria_consumer/screens/history/history.dart';
import 'package:itb_cafeteria_consumer/screens/profile/profile.dart';
import 'package:itb_cafeteria_consumer/screens/search/Search.dart';
import 'package:itb_cafeteria_consumer/services/api_service.dart';
import '../../utils/GlobalTheme.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class BottomTab extends StatelessWidget {
  const BottomTab({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(5),
    child: Tab(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: GlobalTheme.slate800,
          ),
        )
      ],
    )),
    );
  }
}

class _NavPageState extends State<NavPage> with SingleTickerProviderStateMixin {

  void animateToCart() {
    print(5);
    DefaultTabController.of(context).animateTo(5);
  }
  
  @override
  Widget build(BuildContext context) {
    // hello world in middle text
    return DefaultTabController(
      length: 5,
      child: Scaffold(

        bottomNavigationBar: const BottomAppBar(
          elevation: 0,
          child: TabBar(
            labelColor: GlobalTheme.slate800,
            indicatorColor: GlobalTheme.slate800,
            tabs: [
              BottomTab(icon: Icons.food_bank, text: "Kantin"),
              BottomTab(icon: Icons.search, text: "Search"),
              BottomTab(icon: Icons.history, text: "History"),
              BottomTab(icon: Icons.shopping_basket_sharp, text: "Cart"),
              BottomTab(icon: Icons.person_2_rounded, text: "Profile"),
              
            ],
          ),
        ),
        body: Stack(
          children: [
            TabBarView(
              children: [
                Home(animateToCart: animateToCart),
                const Search(),
                const History(),
                const Cart(),
                const Profile(),
              ],
            ),
            GlobalTheme.topBg,
          ],
        )
      ),
    );
  }
}