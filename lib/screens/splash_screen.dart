import 'package:flutter/material.dart';
import 'package:mlsa_amu/screens/home_page.dart';
import 'package:mlsa_amu/utils.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splashWait();
    super.initState();
  }

  void splashWait() {
    Future.delayed(Duration(seconds: 3)).then((onValue) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => HomePage(),
        ),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Utils.height = MediaQuery.of(context).size.height;
    Utils.width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Utils.height * 0.35,
              width: Utils.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://res.cloudinary.com/vidita/image/upload/v1625389955/logo_kayvjr.png',
                  ),
                  //fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                Utils.width * 0.03,
                Utils.width * 0.1,
                Utils.width * 0.03,
                Utils.width * 0.05,
              ),
              child: Text(
                'Microsoft Learn Student Ambassador',
                style: TextStyle(
                  fontSize: Utils.width * 0.045,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1f395e),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                Utils.width * 0.03,
                Utils.width * 0.03,
                Utils.width * 0.03,
                Utils.width * 0.00,
              ),
              child: Text(
                'Abiding by the motto',
                style: TextStyle(
                  fontSize: Utils.width * 0.03,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1f395e),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                Utils.width * 0.03,
                Utils.width * 0.00,
                Utils.width * 0.03,
                Utils.width * 0.05,
              ),
              child: Text(
                '"Be a force for good-locally and globally"',
                style: TextStyle(
                  fontSize: Utils.width * 0.03,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1f395e),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
