import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:itb_cafeteria_consumer/widgets/custom_menu.dart';
import 'package:itb_cafeteria_consumer/widgets/normal_button.dart';

import '../../utils/GlobalTheme.dart';

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

  @override
  Widget build(BuildContext context) {

    Widget buildFood() {
      return Padding(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
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
                        style: TextStyle(
                          fontSize: GlobalTheme.fontsize2,
                          fontWeight: FontWeight.bold,
                          
                        )
                      ),
                      Text(
                        "Deskripsi",
                        style: TextStyle(
                          fontSize: GlobalTheme.fontsize3,
                          height: 1.4
                        )
                      ),
                      Text(
                        "Rp 10.000",
                        style: TextStyle(
                          fontSize: GlobalTheme.fontsize3,
                          fontWeight: FontWeight.bold,
                          height: 1.4
                        )
                      ),
                    ],
                  ),
                ),
                
                Spacer(),
                NormalButton(text: "Tambah", onPressed: () {
                  print("Tambah");
                }),
                SizedBox(width: GlobalTheme.padding1)

              ],
            ),
          ),
        ),
      );
    }

    return CustomMenu(
      hoveringChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getLocation(widget.locationId),
            style: TextStyle(
              fontSize: GlobalTheme.fontsize1,
              fontWeight: FontWeight.bold
            )
          ),
          GroupButton<String>(
            buttons: ["Makanan", "Minuman", "Lainnya"],
            onSelected: (text, indext, context) {
              
            },
          )
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildFood(),
            buildFood(),
            buildFood(),
            buildFood(),
            buildFood(),
            buildFood(),
            buildFood(),
            buildFood(),
          ],
        ),
      ),
    );
  }
}