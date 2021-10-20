import 'package:flutter/material.dart';
import 'package:mlsa_amu/utils/size_config.dart';

class ContributorDetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 4,
      ),
      leading: CircleAvatar(
        radius: SizeConfig.iconGeneralHeightAndWidth,
        backgroundColor: Colors.white,
      ),
      title: Padding(
        padding: EdgeInsets.only(
          bottom: SizeConfig.safeBlockVertical * 0.6,
        ),
        child: Text(
          "Harsh",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      subtitle: Text(
        'Contributions: ' + "5",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
