import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class faqQue extends StatefulWidget {
  const faqQue({Key? key}) : super(key: key);

  @override
  _faqQueState createState() => _faqQueState();
}

class _faqQueState extends State<faqQue> {
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
                initialUrl:
                    "https://www.cdc.gov/coronavirus/2019-ncov/faq.html",
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
