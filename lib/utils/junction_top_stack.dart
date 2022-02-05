import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class junctionTopStack extends StatelessWidget {
  const junctionTopStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: 150,
          margin: EdgeInsets.only(top: 20, bottom: 10, left: 5, right: 10),
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Container(
          width: double.infinity,
          height: 150,
          margin: EdgeInsets.only(top: 15, bottom: 10, left: 10, right: 10),
          decoration: BoxDecoration(
            color: Color(0XFFCFE3FC),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Positioned(
          top: 2,
          left: 15,
          child: Image.asset(
            'assets/doctor.png',
            height: 164,
            width: 158,
          ),
        ),
        Positioned(
          right: 30,
          child: Image.asset(
            'assets/virus2.png',
            height: 50,
            width: 50,
          ),
        ),
        Positioned(
          right: 30,
          top: 45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Know safety tips and",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              Text(
                "precautions from",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              Text(
                "top doctors.",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 22,
                width: 50,
                decoration: BoxDecoration(
                  color: Color(0XFF9156EC),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
