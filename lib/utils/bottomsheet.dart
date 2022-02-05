import 'package:covid_app/utils/components.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void showMyBottomSheet(
    BuildContext context, String title, String description, imageurl, url) {
  showBottomSheet(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      elevation: 20,
      context: context,
      builder: (context) {
        return MyBottomSheetLayout(
          url: url,
          imageurl: imageurl,
          title: title,
          description: description,
        ); // returns your BottomSheet widget
      });
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceWebView: true,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    );
  } else {
    throw 'Could not launch $url';
  }
}

//your bottom sheet widget class
//you can put your things here, like buttons, callbacks and layout
class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, imageurl, url;

  const MyBottomSheetLayout(
      {Key? key,
      required this.title,
      required this.description,
      required this.imageurl,
      required this.url})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BottomSheetImage(imageurl: imageurl, title: title),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "$description",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            //     modifiedText(
            // text: description, size: 16, color: Colors.white)
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: 'Read Full Article',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print(url);
                          _launchURL(url);
                        },
                      style: GoogleFonts.lato(
                        color: Colors.blue.shade400,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
