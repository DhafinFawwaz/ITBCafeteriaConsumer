import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'package:itb_cafeteria_consumer/data/StaticData.dart';
import 'package:itb_cafeteria_consumer/model/cart/cart_model.dart';
import 'package:itb_cafeteria_consumer/model/order/order_model.dart';
import 'package:itb_cafeteria_consumer/services/api_service.dart';
import 'package:itb_cafeteria_consumer/widgets/custom_menu.dart';

import '../../utils/GlobalTheme.dart';
import '../../widgets/rounded_button.dart';
import '../kantin/detail.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});


  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  CartResponse? response;
  int categoryId = 1;

  @override
  void initState() {
    super.initState();
    print("getting data");
    getProducts();
  }

  void onTambah(int orderId) async {
    await APIService.addOrderById(orderId);
    getProducts();
  }
  void onKurang(int orderId) async {
    await APIService.reduceOrder(orderId);
    getProducts();
  }

  void onAddFailed(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
  void onAddsuccess() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Added to cart"),
    ));

    getProducts();
  }

  void getProducts() async {
    response = await APIService.getAllCart();
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

  void onPay() async {
    print("pay");
    await APIService.payAllCart();
    getProducts();
  }

  double getTotalPrice() {
    double price = 0;
    if(response == null) return price;
    for(int i = 0; i < response!.data.length; i++) {
      price += response!.data[i].totalPrice;
    }
    return price;
  }
  int getTotalItems() {
    int items = 0;
    if(response == null) return items;
    for(int i = 0; i < response!.data.length; i++) {
      int total = response!.data[i].orderItem.fold(0, (sum, item) => sum + item.quantity);
      items += total;
    }
    return items;
  }
  String getTotalItemsString() {
    int n = getTotalItems();
    if(n > 1) return '  $n items';
    return '  1 item';
  }

  void onSeeDetails(String title, String description, String price, String imageLink, int shopId, int productId, int orderId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => DetailPage(
          title: title, 
          description: description, 
          price: price, 
          imageLink: imageLink, 
          shopId: shopId, 
          productId: productId,
          onTambah: () {onTambah(orderId);}
        ),
      ),
    ).then((_) {
      setState(() {});
    });
  }

  
  @override
  Widget build(BuildContext context) {

    Widget CartButon = ElevatedButton(
      onPressed: onPay,
      
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        backgroundColor: GlobalTheme.secondaryColor,
        elevation: 0.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ).copyWith(
          elevation: ButtonStyleButton.allOrNull(0.0)
      ),
      child: Container(
        height: 20,
        child: Center(
          child: Row(
            children: [
              Text(
                '  ${getTotalItemsString()}',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                )
              ),
              Spacer(),
              Text(
                "Rp ${getTotalPrice()}   ",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                )
              )
            ],
          ),
        ),
      ),
    );

    Widget buildFood(String title, String description, int quantity, String price, String imageLink, int shopId, int productId, int orderId) {
      return Padding(
        padding: EdgeInsets.only(top: GlobalTheme.padding1),
        child: Container(
          height: 90,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {onSeeDetails(title, description, price, imageLink, shopId, productId, orderId);},
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
                          '$quantity items',
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


                FloatingActionButton(
                  child: Text(
                    "-",
                    style: TextStyle(
                      fontSize: GlobalTheme.fontsize1,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )
                  ),
                  mini: true,
                  elevation: 0,
                  backgroundColor: GlobalTheme.primaryColor,
                  onPressed: () {onKurang(orderId);}
                ),
                FloatingActionButton(
                  child: Text(
                    "+",
                    style: TextStyle(
                      fontSize: GlobalTheme.fontsize1,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )
                  ),
                  mini: true,
                  elevation: 0,
                  backgroundColor: GlobalTheme.primaryColor,
                  onPressed: () {onTambah(orderId);}
                ),
                SizedBox(width: GlobalTheme.padding1)

              ],
            ),
          ),
        ),
      );
    }

    Widget buildSection(String title, String imageLink, List<OrderItem> order, int shopId) {
      
      var productWidgets = List.generate(order.length, (index) => 
        buildFood(
          order[index].productName, 
          order[index].productName, 
          order[index].quantity, 
          order[index].productPrice.toString(), 
          order[index].productImage,
          shopId, 
          order[index].productId,
          order[index].orderItemId
        ),
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



            Row(
              children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(imageLink),
                    radius: 14,
                  ),
                SizedBox(width: GlobalTheme.padding2),
                  Text(
                  title,
                  style: TextStyle(
                    fontSize: GlobalTheme.fontsize2,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ]
            ),
            
            ...productWidgets,
            
            
          ],
        )
      );
    }
    
    

    List<Widget> getList() => List.generate(response!.data.length, (index) => 
    buildSection(response!.data[index].username, 
      response!.data[index].image, response!.data[index].orderItem,
      response!.data[index].shopId
    ));
    return CustomMenu(
      hasBackButton: false,
      hoveringChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cart",
            style: GoogleFonts.inter(
              fontSize: GlobalTheme.fontsize1,
              fontWeight: FontWeight.bold
            )
          ),
          Spacer(),

          CartButon,
          SizedBox(height: GlobalTheme.padding1,)
        ],
      ),
      child: SingleChildScrollView(
        child: (response == null || response?.message == "" || response?.message == null) ? 
        const Center(
          child: CircularProgressIndicator(),
        )
        :
        Column(
          children: [
            ...getList(),
            const SizedBox(height: GlobalTheme.padding1),
          ]
        ),
      ),
      bottomHoverHeight: 80,
      topHoverHeight: 140,
    );
  }
}