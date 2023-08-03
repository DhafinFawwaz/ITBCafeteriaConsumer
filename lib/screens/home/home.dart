import 'package:flutter/material.dart';
import 'package:itb_cafeteria_consumer/screens/kantin/kantin.dart';
import 'package:itb_cafeteria_consumer/utils/GlobalTheme.dart';

import '../../widgets/rounded_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  void loadKantin(int locationId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => KantinPage(locationId: locationId),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () => Future(() => null),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(GlobalTheme.padding1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                const Text(
                  "Kantin",
                  style: TextStyle(
                    fontSize: GlobalTheme.fontsize1,
                    fontWeight: FontWeight.bold
                  ),
                ),
              
                const SizedBox(height: GlobalTheme.padding1),
              
                FittedBox(
                  fit: BoxFit.fill,
                  child: Container(
                    height: 400.0,
                    width: 400.0,
                    color: GlobalTheme.slate200,
                  ),
                ),

                const SizedBox(height: GlobalTheme.padding1),
              
                RoundedButton(
                  text: "Kantin GKUB",
                  color: GlobalTheme.slate700,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(GlobalTheme.circular),
                    topRight: Radius.circular(GlobalTheme.circular)
                  ), 
                  onPressed: () {
                    loadKantin(1);
                  }
                ),
                RoundedButton(
                  text: "Kantin GKUT",
                  color: GlobalTheme.slate700,
                  borderRadius: BorderRadius.zero, 
                  onPressed: () {
                    loadKantin(2);
                  }
                ),
                RoundedButton(
                  text: "Kantin Depan",
                  color: GlobalTheme.slate700,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(GlobalTheme.circular),
                    bottomRight: Radius.circular(GlobalTheme.circular)
                  ), 
                  onPressed: () {
                    loadKantin(3);
                  }
                ),
              
                SizedBox(height: GlobalTheme.padding1),
              
                const Text(
                  "Status Order",
                  style: TextStyle(
                    fontSize: GlobalTheme.fontsize1,
                    fontWeight: FontWeight.bold
                  ),
                ),

                
              
              ],
            ),
          
          ),
        ),
      ),
    );
  }
}