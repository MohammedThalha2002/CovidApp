import 'package:covid_app/pages/junction.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'dart:ui';

class BoardingSymptoms extends StatefulWidget {
  const BoardingSymptoms({Key? key}) : super(key: key);

  @override
  State<BoardingSymptoms> createState() => _BoardingSymptomsState();
}

class _BoardingSymptomsState extends State<BoardingSymptoms> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Center(
          child: Image.asset(
            'assets/img1.gif',
            scale: 2,
          ),
        ),
        title:
            "A dry or sometimes tickly cough is a cough that does not bring up any phlegm or mucus. Dry coughs may cause a tickling sensation and are often due to irritation in the throat.",
        body: "",
        decoration: PageDecoration(
          pageColor: Colors.white,
          imageFlex: 2,
        ),
      ),
      PageViewModel(
        image: Center(
          child: Image.asset(
            'assets/img2.gif',
            scale: 2,
          ),
        ),
        title:
            "Headaches are a very common condition that most people will experience many times during their lives. The main symptom of a headache is a pain in your head or face. ",
        body: "",
        decoration: PageDecoration(
          pageColor: Colors.white,
          imageFlex: 2,
        ),
      ),
      PageViewModel(
        image: Center(
          child: Image.asset(
            'assets/img3.gif',
            scale: 2,
          ),
        ),
        title:
            "Hemoptysis is when you cough up blood from your lungs. It can be a sign of a serious medical condition. Infections, cancer, and problems in blood vessels in your lungs can cause it.",
        body: "",
        decoration: PageDecoration(
          pageColor: Colors.white,
          imageFlex: 2,
        ),
      ),
      PageViewModel(
        image: Center(
          child: Image.asset(
            'assets/img4.gif',
            scale: 2,
          ),
        ),
        title:
            "Pneumonia is an infection that inflames the air sacs in one or both lungs. The air sacs may fill with fluid or pus (purulent material), causing cough with phlegm or pus, fever, chills, and difficulty breathing.",
        body: "",
        decoration: PageDecoration(
          pageColor: Colors.white,
          imageFlex: 2,
        ),
      ),
      PageViewModel(
        image: Center(
          child: Image.asset(
            'assets/img5.gif',
            scale: 2,
          ),
        ),
        title:
            "A sore throat is an early symptom of COVID-19, usually appearing in the first week of illness and improving quite quickly. It feels worse on the first day of infection but gets better on each following day.",
        body: "",
        decoration: PageDecoration(
          pageColor: Colors.white,
          imageFlex: 2,
        ),
      ),
      PageViewModel(
        image: Center(
          child: Image.asset(
            'assets/img6.gif',
            scale: 2,
          ),
        ),
        title:
            "Shortness of breath, or dyspnea, is an uncomfortable condition that makes it difficult to get air into your lungs. Problems with your heart and lungs can harm your breathing.",
        body: "",
        decoration: PageDecoration(
          pageColor: Colors.white,
          imageFlex: 2,
        ),
      ),
      PageViewModel(
        image: Center(
          child: Image.asset(
            'assets/img7.gif',
            scale: 2,
          ),
        ),
        title:
            "Diarrhea is loose, watery stools (bowel movements). You have diarrhea if you have loose stools three or more times in one day. Acute diarrhea is diarrhea that lasts a short time. It is a common problem.",
        body: "",
        decoration: PageDecoration(
          imageFlex: 2,
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
