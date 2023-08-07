import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:itb_cafeteria_consumer/data/StaticData.dart';
import 'package:itb_cafeteria_consumer/model/product/suggestion_model.dart';
import 'package:itb_cafeteria_consumer/services/api_service.dart';
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

  SuggestionResponse? response;
  int categoryId = 1;

  @override
  void initState() {
    super.initState();
    print("getting data");
    getProducts();
  }

  void getProducts() async {
    print("getting data");
    response = await APIService.getProductSuggestion(widget.locationId, categoryId);
    print(response!.data.toString());
    setState(() {});
  }

  void onCategorySelected(index) {
    categoryId = index+1;
    response?.message = "";
    getProducts();
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

    
    Widget buildFood(String title, String description, String price, String imageLink) {
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

                Image.network(
                  imageLink,
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    width: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.inter(
                            fontSize: GlobalTheme.fontsize2,
                            fontWeight: FontWeight.bold,
                            
                          )
                        ),
                        Text(
                          description,
                          style: GoogleFonts.inter(
                            fontSize: GlobalTheme.fontsize4,
                            height: 1.4
                          )
                        ),
                        Text(
                          "Rp $price",
                          style: GoogleFonts.inter(
                            fontSize: GlobalTheme.fontsize3,
                            fontWeight: FontWeight.bold,
                            height: 1.4
                          )
                        ),
                      ],
                    ),
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

    Widget buildSection(String title, String description, String imageLink, List<Product> product_array) {
      
      var productWidgets = List.generate(product_array.length, (index) => 
        buildFood(product_array[index].name, product_array[index].description, product_array[index].price.toString(), product_array[index].image),
      );
      
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
              title,
              style: TextStyle(
                fontSize: GlobalTheme.fontsize2,
                fontWeight: FontWeight.bold
              ),
            ),
            
            ...productWidgets,
            
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
            StaticData.getLocationById(widget.locationId),
            style: GoogleFonts.inter(
              fontSize: GlobalTheme.fontsize1,
              fontWeight: FontWeight.bold
            )
          ),
          GroupButton<String>(
            buttons: ["Makanan", "Minuman", "Lainnya"],
            onSelected: (text, index, context) {
              onCategorySelected(index);
            },
            options: GroupButtonOptions(
              borderRadius: BorderRadius.circular(GlobalTheme.circular),
              selectedTextStyle: GoogleFonts.inter(
                color: Colors.white,
              ),
              selectedColor: GlobalTheme.primaryColor,
            ) ,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: (response?.message == "" || response?.message == null) ? 
        const Center(
          child: CircularProgressIndicator(),
        )
        :
        Column(
          children: List.generate(response!.data.length, (index) => 
            buildSection(response!.data[index].username, response!.data[index].description, 
              response!.data[index].image, response!.data[index].productArray
            )
          ),
        )
      ),
    );
  }
}