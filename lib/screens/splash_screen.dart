import 'package:flutter/material.dart';
import 'package:mlsa_amu/Utils/size_config.dart';
import 'package:mlsa_amu/screens/home_page.dart';

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
    SizeConfig.initOnStartUp(context);
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
              height: SizeConfig.screenHeight * 0.35,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets\images\mlsa-logo.png",
                  ),
                  //fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 4,
                vertical: SizeConfig.safeBlockVertical * 3,
              ),
              child: Text(
                'Microsoft Learn Student Ambassador',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: SizeConfig.baseFontSize * 4.5,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1f395e),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 4,
              ),
              child: Text(
                'Abiding by the motto',
                style: TextStyle(
                  fontSize: SizeConfig.baseFontSize * 3,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1f395e),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 4,
              ),
              child: Text(
                '"Be a force for good-locally and globally"',
                style: TextStyle(
                  fontSize: SizeConfig.baseFontSize * 3,
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
