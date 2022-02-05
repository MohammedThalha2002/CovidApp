import 'package:covid_app/backend/world_live_counts.dart';
import 'package:covid_app/utils/Piechart.dart';
import 'package:covid_app/utils/graph_points.dart';
import 'package:covid_app/utils/graphs.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:ui';
import 'dart:io';

class liveCount extends StatefulWidget {
  const liveCount({Key? key}) : super(key: key);

  @override
  _liveCountState createState() => _liveCountState();
}

class _liveCountState extends State<liveCount> {
  var confirmed;
  var active;
  var recovered;
  var deaths;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stManagement();
  }

  Future stManagement() async {
    var data = await WorldLiveData();
    setState(() {
      print("This was printed in function");
      print(data);
      confirmed = data['cases'];
      active = data['active'];
      recovered = data['recovered'];
      deaths = data['deaths'];
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.12,
                ),
                children: [
                  containers(
                      counts: confirmed == null ? "LOADING" : "$confirmed",
                      size: size,
                      colour: (Colors.red[100])!,
                      svgColor: (Colors.red[600])!,
                      text: "CONFIRMED",
                      points: getPoints1(),
                      context: context,
                      img: "running.svg"),
                  containers(
                      counts: active != null ? "$active" : "LOADING",
                      size: size,
                      colour: (Colors.blue[100])!,
                      svgColor: (Colors.blue[900])!,
                      text: "ACTIVE",
                      context: context,
                      points: getPoints2(),
                      img: "running.svg"),
                  containers(
                      counts: recovered != null ? "$recovered" : "LOADING",
                      size: size,
                      colour: (Colors.green[100])!,
                      svgColor: (Colors.green[600])!,
                      text: "RECOVERED",
                      context: context,
                      points: getPoints3(),
                      img: "running.svg"),
                  containers(
                      counts: deaths != null ? "$deaths" : "LOADING",
                      size: size,
                      colour: (Colors.grey[400])!,
                      svgColor: (Colors.grey[900])!,
                      text: "DEATHS",
                      points: getPoints1(),
                      context: context,
                      img: "running.svg"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Covid Affected Places',
                      style: TextStyle(
                        fontFamily: GoogleFonts.actor().fontFamily,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage('assets/coronavirus_maps.png'),
                      )),
                  child: Row(children: [
                    // piechart()
                  ]),
                ),
              ),
              InkWell(
                onTap: () {
                  if (Platform.isAndroid || Platform.isLinux) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => webView(),
                      ),
                    );
                  } else {
                    _launchURL('https://www.bing.com/covid/local/india');
                  }
                },
                child: Text(
                  'View more',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget containers(
    {required Size size,
    required Color colour,
    required Color svgColor,
    required var points,
    required var context,
    required String counts,
    required String img,
    required String text}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    decoration: BoxDecoration(
      color: colour,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  "assets/$img",
                  color: svgColor,
                  height: 14,
                  width: 14,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "$text",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: svgColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "$counts",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: svgColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 30,
              ),
              Expanded(
                flex: 1,
                child: graphs(
                  points: points,
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

class webView extends StatefulWidget {
  const webView({Key? key}) : super(key: key);

  @override
  State<webView> createState() => _webViewState();
}

class _webViewState extends State<webView> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: "https://www.bing.com/covid/local/india",
                onPageFinished: (finish) {
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(),
          ],
        ),
      ),
    );
  }
}
