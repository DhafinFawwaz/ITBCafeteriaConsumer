import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itb_cafeteria_consumer/screens/kantin/kantin.dart';
import 'package:itb_cafeteria_consumer/utils/GlobalTheme.dart';

import '../../widgets/rounded_button.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.animateToCart});

  final VoidCallback animateToCart;

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  void loadKantin(int locationId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => KantinPage(locationId: locationId, animateToCart: widget.animateToCart),
      ),
    );
  }

  Widget dashedLines = Container(
    color: GlobalTheme.slate200,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: List.generate(80, (index) => Expanded(
          child: Container(
            color: index%2==0?Colors.transparent :GlobalTheme.slate300,
            height: 3,
          ))
        ),
      ),
    ),
  );
  
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
                
                Text(
                  "Kantin",
                  style: GoogleFonts.inter(
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
                    child: Image.asset(
                      "assets/images/mapITB.png",
                      fit: BoxFit.contain,),
                  ),
                ),
            
                const SizedBox(height: GlobalTheme.padding1),
            
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: RoundedButton(
                    text: "Kantin GKUB",
                    backgroundColor: GlobalTheme.slate200,
                    textColor: GlobalTheme.slate700,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(GlobalTheme.circular),
                      topRight: Radius.circular(GlobalTheme.circular)
                    ), 
                    height: 30,
                    onPressed: () {
                      loadKantin(1);
                    }
                  ),
                ),
                dashedLines,
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: RoundedButton(
                    text: "Kantin GKUT",
                    backgroundColor: GlobalTheme.slate200,
                    textColor: GlobalTheme.slate700,
                    borderRadius: BorderRadius.zero, 
                    height: 30,
                    onPressed: () {
                      loadKantin(2);
                    }
                  )
                ),
                dashedLines,
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: RoundedButton(
                    text: "Kantin Depan",
                    backgroundColor: GlobalTheme.slate200,
                    textColor: GlobalTheme.slate700,
                    borderRadius: BorderRadius.zero, 
                    height: 30,
                    onPressed: () {
                      loadKantin(3);
                    }
                  )
                ),
                dashedLines,
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: RoundedButton(
                    text: "Kantin Borju",
                    backgroundColor: GlobalTheme.slate200,
                    textColor: GlobalTheme.slate700,
                    borderRadius: BorderRadius.zero, 
                    height: 30,
                    onPressed: () {
                      loadKantin(4);
                    }
                  )
                ),
                dashedLines,
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: RoundedButton(
                    text: "Kantin SBM",
                    backgroundColor: GlobalTheme.slate200,
                    textColor: GlobalTheme.slate700,
                    borderRadius: BorderRadius.zero, 
                    height: 30,
                    onPressed: () {
                      loadKantin(5);
                    }
                  )
                ),
                dashedLines,
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: RoundedButton(
                    text: "Kantin CRCS",
                    backgroundColor: GlobalTheme.slate200,
                    textColor: GlobalTheme.slate700,
                    borderRadius: BorderRadius.zero, 
                    height: 30,
                    onPressed: () {
                      loadKantin(6);
                    }
                  )
                ),
                dashedLines,
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: RoundedButton(
                    text: "Kantin Saraga",
                    backgroundColor: GlobalTheme.slate200,
                    textColor: GlobalTheme.slate700,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(GlobalTheme.circular),
                      bottomRight: Radius.circular(GlobalTheme.circular)
                    ), 
                    height: 30,
                    onPressed: () {
                      loadKantin(7);
                    }
                  )
                
                ),
              
                SizedBox(height: GlobalTheme.padding1),
              
                Text(
                  "Status Order",
                  style: GoogleFonts.inter(
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