import 'package:covid_app/backend/news_backend.dart';
import 'package:covid_app/utils/newsbox%20copy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:ui';

class Constants {
  static String imageurl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGkAznCVTAALTD1o2mAnGLudN9r-bY6klRFB35J2hY7gvR9vDO3bPY_6gaOrfV0IHEIUo&usqp=CAU';
}

class covidNews extends StatefulWidget {
  const covidNews({Key? key}) : super(key: key);

  @override
  _covidNewsState createState() => _covidNewsState();
}

class _covidNewsState extends State<covidNews> {
  var title;
  var imgurl;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stManagement();
  }

  Future stManagement() async {
    var data = await CovidNewsData();
    setState(() {
      print("This was printed in function");
      // print(data);
      title = data[0]['title']; //articles[0].title
      imgurl = data[0]['urlToImage']; //articles[0].urlToImage
    });
    print(title);
    print(imgurl);
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
          "Covid Newz",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: FutureBuilder<List>(
                  future: CovidNewsData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return NewsBox(
                              url: snapshot.data![index]['url'],
                              imageurl:
                                  snapshot.data![index]['urlToImage'] != null
                                      ? snapshot.data![index]['urlToImage']
                                      : Constants.imageurl,
                              title: snapshot.data![index]['title'],
                              time: snapshot.data![index]['publishedAt'],
                              description: snapshot.data![index]['description']
                                  .toString(),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    // By default, show a loading spinner.
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.blue,
                    ));
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
