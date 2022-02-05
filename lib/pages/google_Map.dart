import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleMap extends StatefulWidget {
  const GoogleMap({Key? key}) : super(key: key);

  @override
  _GoogleMapState createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          'COVID AFFECTED PLACES',
          style: TextStyle(
            fontFamily: GoogleFonts.sintony().fontFamily,
            color: Colors.black,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
