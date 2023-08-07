import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Align(
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
              Text("[Nama Makanan]", textDirection: TextDirection.ltr, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
              Text("[Harga]", textDirection: TextDirection.ltr, style: TextStyle(color: Colors.black, fontSize: 16)),
            ],),
            Text("[Deskripsi]", textDirection: TextDirection.ltr, style: TextStyle(color: Colors.black, fontSize: 16)),
            Flexible(
              flex: 1,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.deepOrange),
                borderRadius: BorderRadius.all(Radius.circular(100))),
                child: Center(
                  child: Text("Tambah", textDirection: TextDirection.ltr, textAlign: TextAlign.center, style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

