import 'package:covid_app/utils/home_screen_stack.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0XFFCFE3FC),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/bg_image.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            homeStack(),
          ],
        ),
      ),
    );
  }
}
