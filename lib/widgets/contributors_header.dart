import 'package:flutter/material.dart';
import 'package:mlsa_amu/utils/size_config.dart';

class ContributorsHeader extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final int data;
  final String dataText;
  ContributorsHeader(
    this.iconData,
    this.data,
    this.dataText, {
    this.iconColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.safeBlockVertical * 0.6,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: iconColor,
            size: SizeConfig.iconGeneralHeightAndWidth * 0.5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 2,
            ),
            child: Text(
              data.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.baseFontSize * 4.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.safeBlockHorizontal * 2.5,
            ),
            child: Text(
              dataText,
              style: TextStyle(
                color: Colors.grey,
                fontSize: SizeConfig.baseFontSize * 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
