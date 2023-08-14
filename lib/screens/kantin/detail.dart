import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.title, required this.description, required this.price, required this.imageLink, required this.shopId, required this.productId, required this.onTambah});

  final String title;
  final String description;
  final String price;
  final String imageLink;
  final int shopId;
  final int productId;
  final VoidCallback onTambah;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FittedBox(
            child: Image.network(
              widget.imageLink,
            ),
            fit: BoxFit.fill,
          ),
            
          Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            height: 200,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              textDirection: TextDirection.ltr,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: TextDirection.ltr,
                  children: [
                  Text(widget.title, textDirection: TextDirection.ltr, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Rp ${widget.price}', textDirection: TextDirection.ltr, style: TextStyle(color: Colors.black, fontSize: 16)),
                ],),
                Text(widget.description, textDirection: TextDirection.ltr, style: TextStyle(color: Colors.black, fontSize: 16)),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.deepOrange),
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: InkWell(
                      onTap: widget.onTambah,
                      child: Center(
                        child: Text("Tambah", textDirection: TextDirection.ltr, textAlign: TextAlign.center, style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )]
        ,
      ),
    );
  }
}

