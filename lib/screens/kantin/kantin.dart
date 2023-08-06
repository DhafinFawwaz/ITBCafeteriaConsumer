import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:itb_cafeteria_consumer/widgets/custom_menu.dart';
import 'package:itb_cafeteria_consumer/widgets/normal_button.dart';

import '../../utils/GlobalTheme.dart';
import '../../widgets/rounded_button.dart';

class KantinPage extends StatefulWidget {
  const KantinPage({super.key, required this.locationId});

  final int locationId;
  @override
  State<KantinPage> createState() => _KantinPageState();
}

class _KantinPageState extends State<KantinPage> {

  String getLocation(int locationId) {
    if(locationId == 1) return "Kantin GKUB";
    else if(locationId == 2) return "Kantin GKUT";
    else if(locationId == 3) return "Kantin Depan";
    else return "Kantin Depan";
  }

  void onSeeMore() {

  }

  final Row dashedLines = Row(
    children: List.generate(80, (index) => Expanded(
      child: Container(
        color: index%2==0?Colors.transparent :Colors.grey,
        height: 3,
      ))
    ),
  );

  @override
  Widget build(BuildContext context) {

    
    Widget buildFood() {
      return Padding(
        padding: EdgeInsets.only(top: GlobalTheme.padding1),
        child: Container(
          height: 90,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              print("tapped");
            },
            child: Row(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  color: GlobalTheme.slate200,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nasi Goreng",
                        style: GoogleFonts.inter(
                          fontSize: GlobalTheme.fontsize2,
                          fontWeight: FontWeight.bold,
                          
                        )
                      ),
                      Text(
                        "Deskripsi",
                        style: GoogleFonts.inter(
                          fontSize: GlobalTheme.fontsize3,
                          height: 1.4
                        )
                      ),
                      Text(
                        "Rp 10.000",
                        style: GoogleFonts.inter(
                          fontSize: GlobalTheme.fontsize3,
                          fontWeight: FontWeight.bold,
                          height: 1.4
                        )
                      ),
                    ],
                  ),
                ),
                
                Spacer(),
                RoundedButton(
                  text: "Tambah", 
                  borderRadius: BorderRadius.circular(20),
                  color: GlobalTheme.primaryColor,
                  onPressed: () {
                  print("Tambah");
                }),
                SizedBox(width: GlobalTheme.padding1)

              ],
            ),
          ),
        ),
      );
    }

    Widget buildSection() {
      return Padding(
        padding: EdgeInsets.only(
          top: GlobalTheme.padding1,
          left: GlobalTheme.padding1,
          right: GlobalTheme.padding1,
          bottom: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            dashedLines,
            
            SizedBox(height: GlobalTheme.padding2),

            Text(
              "Toko A",
              style: TextStyle(
                fontSize: GlobalTheme.fontsize2,
                fontWeight: FontWeight.bold
              ),
            ),
            buildFood(),
            buildFood(),
            buildFood(),

            SizedBox(height: GlobalTheme.padding2),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: RoundedButton(text: "See More", borderRadius: BorderRadius.circular(20), color: GlobalTheme.primaryColor, onPressed: onSeeMore),
            ),
            
          ],
        )
      );
    }


    return CustomMenu(
      hoveringChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getLocation(widget.locationId),
            style: GoogleFonts.inter(
              fontSize: GlobalTheme.fontsize1,
              fontWeight: FontWeight.bold
            )
          ),
          GroupButton<String>(
            buttons: ["Makanan", "Minuman", "Lainnya"],
            onSelected: (text, indext, context) {

            },
            options: GroupButtonOptions(
              borderRadius: BorderRadius.circular(GlobalTheme.circular),
              selectedTextStyle: GoogleFonts.inter(
                color: Colors.white,
              ),
            ) ,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildSection(),
            buildSection(),
            buildSection(),
          ],
        ),
      ),
    );
  }
}