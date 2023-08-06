import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itb_cafeteria_consumer/utils/GlobalTheme.dart';
import 'package:itb_cafeteria_consumer/utils/text_style.dart';
import 'package:itb_cafeteria_consumer/widgets/searchHistory_button.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(GlobalTheme.padding1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Search",
                  style: TextStyle(
                    fontSize: GlobalTheme.fontsize1,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: GlobalTheme.padding1,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(243, 243, 243, 1),
                    border: Border.all(
                      color:  Color.fromRGBO(218, 218, 218, 1),
                    ),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 15,),
                      const Icon(
                        Icons.search,
                        size: 30,
                        weight: 2,
                      ),
                      SizedBox(width: GlobalTheme.padding2,),
                      Text(
                        "Mau makan apa?",
                        style: GoogleFonts.inter(
                          fontSize: GlobalTheme.fontsize2,
                          fontWeight:FontWeight.w300,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: GlobalTheme.padding1,),
                Text(
                  "Kamu pernah mencari...",
                  style: GoogleFonts.inter(
                    fontSize: GlobalTheme.fontsize2,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: GlobalTheme.padding1,),
                Container(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      searchHistoryButton(text: "Internet"), 
                      searchHistoryButton(text: "Ayam Kebuli"), 
                      searchHistoryButton(text: "Aqua"), 
                      searchHistoryButton(text: "Prime"), 
                      searchHistoryButton(text: "Sate"), 
                      searchHistoryButton(text: "Ikan Panggang"), 
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}