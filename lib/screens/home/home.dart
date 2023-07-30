import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:itb_cafeteria_consumer/services/api_service.dart';
import 'package:itb_cafeteria_consumer/services/shared_service.dart';
import 'package:itb_cafeteria_consumer/widgets/normal_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            NormalButton(
              text: "Logout", 
              onPressed: () {
                SharedService.logout(context);
              }
            ),
            userProfile(),
          ],
        )
      )
    );
  }
}