import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';

var githubURL = 'https://github.com/knikhurpa';
var linkedinURL = 'https://www.linkedin.com/in/knikhurpa';
var mailtoLink = Mailto(
  to: ['me@nikhurpa.co.in'],
).toString();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage('images/profile.jpg'),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Kavindra\nNikhurpa',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 40.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'FLUTTER DEVELOPER',
                      textStyle: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 5.0,
                      ),
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                  repeatForever: false,
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 500),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
                SizedBox(
                  height: 30.0,
                  width: 150.0,
                  child: Divider(
                    thickness: 2.0,
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    onTap: () async => await canLaunch(mailtoLink)
                        ? launch(mailtoLink)
                        : throw 'Could not launch $mailtoLink',
                    leading: FaIcon(FontAwesomeIcons.envelope),
                    title: Text(
                      'me@nikhurpa.co.in',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    onTap: () async => await canLaunch(githubURL)
                        ? await launch(githubURL)
                        : throw 'Could not launch $githubURL',
                    leading: FaIcon(FontAwesomeIcons.github),
                    title: Text(
                      'github.com/knikhurpa',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    onTap: () async => await canLaunch(linkedinURL)
                        ? await launch(linkedinURL)
                        : throw 'Could not launch $linkedinURL',
                    leading: FaIcon(FontAwesomeIcons.linkedin),
                    title: Text(
                      'linkedin.com/in/knikhurpa',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
