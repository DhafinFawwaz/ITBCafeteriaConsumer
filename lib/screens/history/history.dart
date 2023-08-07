import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: EdgeInsets.only(left: 28, top: 40),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(blurRadius: 5)]),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xffFFFFFF),
                child: Container(
                  width: double.infinity,
                  height: 17,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Vector (3).png'))),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "History",
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 28, top: 20),
        child: Row(children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            width: 98,
            height: 31,
            decoration: BoxDecoration(
                color: Color(0xffF3F3F3),
                borderRadius: BorderRadius.all(Radius.circular(26)),
                border: Border.all(width: 1, color: Color(0xffDADADA))),
            child: Row(
              children: [
                Text("Tanggal",
                    style: TextStyle(
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
                Container(
                    width: 12,
                    margin: EdgeInsets.only(left: 5),
                    height: 12,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/down.png')))),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.only(left: 10),
            width: 96,
            height: 31,
            decoration: BoxDecoration(
                color: Color(0xffF3F3F3),
                borderRadius: BorderRadius.all(Radius.circular(26)),
                border: Border.all(width: 1, color: Color(0xffDADADA))),
            child: Row(
              children: [
                Text("Metode",
                    style: TextStyle(
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
                Container(
                    width: 12,
                    margin: EdgeInsets.only(left: 5),
                    height: 12,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/down.png')))),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.only(left: 10),
            width: 74,
            height: 31,
            decoration: BoxDecoration(
                color: Color(0xffF3F3F3),
                borderRadius: BorderRadius.all(Radius.circular(26)),
                border: Border.all(width: 1, color: Color(0xffDADADA))),
            child: Row(
              children: [
                Text("Toko",
                    style: TextStyle(
                        fontFamily: 'inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
                Container(
                    width: 12,
                    margin: EdgeInsets.only(left: 5),
                    height: 12,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/down.png')))),
              ],
            ),
          ),
        ]),
      ),
      Padding(
        padding: EdgeInsets.only(left: 29, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HistoryOrder(),
            SizedBox(
              height: 20,
            ),
            HistoryOrder(),
            SizedBox(
              height: 20,
            ),
            HistoryOrder()
          ],
        ),
      )
    ]);
  }
}

class HistoryOrder extends StatelessWidget {
  const HistoryOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 106,
      decoration: BoxDecoration(
        color: Color(0xffF3F3F3),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 1, color: Color(0xffDADADA)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Text(
                        "Kantin GKUB",
                        style: TextStyle(
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      ),
                      margin: EdgeInsets.only(top: 15)),
                  Divider(height: 6),
                  Container(
                    child: Text('1 Kopi, 1 Nasi ayam',
                        style: TextStyle(
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w300,
                            fontSize: 12)),
                  ),
                  Divider(height: 10),
                  Container(
                      child: Text('Rp45.1000',
                          style: TextStyle(
                              fontFamily: 'inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w500))),
                  Divider(height: 3),
                  Container(
                      child: Text('29 Feb 09:23 AM',
                          style: TextStyle(
                              fontFamily: 'inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 12))),
                ],
              ),
              SizedBox(
                width: 120,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      child: Text('Selesai',
                          style: TextStyle(
                              fontFamily: 'inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                      margin: EdgeInsets.only(top: 15)),
                  Divider(
                    height: 3,
                  ),
                  Container(
                      child: Text("Pesanan A-120412",
                          style: TextStyle(
                              fontFamily: 'inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w300))),
                  Container(
                      width: 80,
                      height: 23,
                      padding: EdgeInsets.only(top: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(19)),
                          border: Border.all(color: Color(0xffF87328))),
                      margin: EdgeInsets.only(top: 30),
                      child: Text("Pesan lagi",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xffF87328),
                              fontFamily: 'inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w600)))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
