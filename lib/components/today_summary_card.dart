import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodaySummaryCard extends StatelessWidget {
  const TodaySummaryCard({super.key, required this.title, required this.icon});

  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Color.fromRGBO(240, 244, 248, 1),
        borderRadius: BorderRadius.circular(11),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 15),
          SizedBox(width: 10, child: icon),
          SizedBox(width: 30),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(
            width: 40,
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios_rounded, size: 16),
              onPressed: () {},
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
