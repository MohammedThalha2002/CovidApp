import 'package:covid_app/pages/junction.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'dart:ui';

class preventions extends StatefulWidget {
  const preventions({Key? key}) : super(key: key);

  @override
  State<preventions> createState() => _preventionsState();
}

class _preventionsState extends State<preventions> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Center(
          child: Image.asset(
            'assets/pic1.gif',
            scale: 2,
          ),
        ),
        title:
            "What are some preventative measures for COVID-19? Preventive measures include physical or social distancing, quarantining, ventilation of indoor spaces, covering coughs and sneezes, hand washing, and keeping unwashed hands away from the face.",
        body: "",
        decoration: PageDecoration(
          pageColor: Colors.white,
          imageFlex: 1,
        ),
      ),
      PageViewModel(
        image: Center(
          child: Image.asset(
            'assets/pic2.gif',
            scale: 2,
          ),
        ),
        title:
            "Hand washing is one of the most effective ways to prevent the spread of bacterial and viral illnesses. Hand washing is one of the most effective ways to prevent the spread of bacterial and viral illnesses.",
        body: "",
        decoration: PageDecoration(
          pageColor: Colors.white,
          imageFlex: 1,
        ),
      ),
      PageViewModel(
        image: Center(
          child: Image.asset(
            'assets/pic3.gif',
            scale: 2,
          ),
        ),
        title:
            "One of the best ways to stay healthy during the pandemic is to wash your hands with soap and water. But if those aren’t available, hand sanitizer may help rid your hands of germs that can cause COVID-19.",
        body: "",
        decoration: PageDecoration(
          pageColor: Colors.white,
          imageFlex: 1,
        ),
      ),
      PageViewModel(
        image: Center(
          child: Image.asset(
            'assets/pic4.gif',
            scale: 2,
          ),
        ),
        title:
            "Protective masks are said to lower the chances of coronavirus entering our respiratory system through droplets that are present in the air. Wearing of masks is especially recommended for people living in densely populated areas.",
        body: "",
        decoration: PageDecoration(
          pageColor: Colors.white,
          imageFlex: 1,
        ),
      ),
      PageViewModel(
        image: Center(
          child: Image.asset(
            'assets/pic5.gif',
            scale: 2,
          ),
        ),
        title:
            "The fewer people you're around, the lower your chance of infection. When you stay home, you help stop the spread to other.",
        body: "",
        decoration: PageDecoration(
          pageColor: Colors.white,
          imageFlex: 1,
        ),
      ),
      PageViewModel(
        image: Center(
          child: Image.asset(
            'assets/pic6.gif',
            scale: 2,
          ),
        ),
        title:
            "All travel comes with some risk of getting or spreading COVID-19. Before you travel, check if COVID-19 is spreading in your local area and in any of the places you are going.",
        body: "",
        decoration: PageDecoration(
          pageColor: Colors.white,
          imageFlex: 1,
        ),
      ),
      PageViewModel(
        image: Center(
          child: Image.asset(
            'assets/pic7.gif',
            scale: 2,
          ),
        ),
        title:
            "Social distancing can make it harder for the virus to spread, as the droplets are unlikely to travel too far.",
        body: "",
        decoration: PageDecoration(
          imageFlex: 1,
          pageColor: Colors.white,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IntroductionScreen(
        onDone: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CovidCount(),
          ),
        ),
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        curve: Curves.easeOutBack,
        skip: const Text(''),
        next: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.blue),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
          ),
        ),
        done: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.blue),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
              Icons.done,
              color: Colors.white,
            ),
          ),
        ),
        pages: getPages(),
      ),
    );
  }
}
