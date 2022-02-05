import 'package:covid_app/pages/junction.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homeStack extends StatelessWidget {
  const homeStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(bottom: 10, top: 15, left: 20, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Be aware",
              style: TextStyle(
                fontSize: 35,
                fontFamily: GoogleFonts.questrial().fontFamily,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Stay healthy",
              style: TextStyle(
                fontSize: 35,
                fontFamily: GoogleFonts.questrial().fontFamily,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Welcome to COVID-19 information portal.",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
                fontSize: 15,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "GET STARTED",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CovidCount()));
                  },
                  backgroundColor: Color(0XFF9156EC),
                  child: Icon(Icons.arrow_forward),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
