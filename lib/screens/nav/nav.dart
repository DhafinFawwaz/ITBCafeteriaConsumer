import 'package:flutter/material.dart';
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
        Text(text)
      ],
    )),
    );
  }
}

class _NavPageState extends State<NavPage> {

  Widget userProfile() {
    return FutureBuilder(
      future: APIService.getUserProfile(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if(snapshot.hasData) {
          return Column(
            children: [
              Text(snapshot.data!),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator()
        );
      }
    );
  }

  


  @override
  Widget build(BuildContext context) {
    // hello world in middle text
    return const DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: TabBar(
            labelColor: GlobalTheme.slate800,
            indicatorColor: GlobalTheme.slate800,
            tabs: [
              BottomTab(icon: Icons.food_bank, text: "Kantin"),
              BottomTab(icon: Icons.search, text: "Search"),
              BottomTab(icon: Icons.history, text: "History"),
              BottomTab(icon: Icons.person_2_rounded, text: "Profile"),
              
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Home(),
            Profile(),
            History(),
            Search(),
          ],
        )
      ),
    );
  }
}