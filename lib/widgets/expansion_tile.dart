import 'package:flutter/material.dart';
import 'package:mlsa_amu/utils/size_config.dart';

class Expansion extends StatefulWidget {
  final bool isExpanded;
  final List expansionTileDetails;
  final int index;
  Expansion({
    required this.isExpanded,
    required this.expansionTileDetails,
    required this.index,
  });

  @override
  _ExpansionState createState() => _ExpansionState();
}

class _ExpansionState extends State<Expansion> {
  bool expanded = false;
  List<IconData> iconList = [
    Icons.people,
    Icons.favorite_border_rounded,
    Icons.star_border,
  ];
  List<String> heading = [
    "Organizers",
    "Sponsors",
    "Winners",
  ];
  void initState() {
    super.initState();
    expanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: Color(0XFF0B0B0D),
      title: Text(
        heading[widget.index],
        style: TextStyle(
          fontSize: SizeConfig.baseFontSize * 4.5,
        ),
      ),
      leading: Icon(
        iconList[widget.index],
        color: Colors.white,
      ),
      textColor: Colors.white,
      collapsedTextColor: Colors.white,
      trailing: Container(
        width: SizeConfig.screenHeight * 0.04,
        height: SizeConfig.screenHeight * 0.04,
        decoration: BoxDecoration(
          color: expanded ? Color(0XFF17181C) : Color(0XFF0B0B0D),
          shape: BoxShape.circle,
        ),
        child: Icon(
          expanded
              ? Icons.keyboard_arrow_up_outlined
              : Icons.keyboard_arrow_down_outlined,
          color: Colors.white,
        ),
      ),
      children: widget.expansionTileDetails
          .map(
            (element) => ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.grey,
              ),
              title: Text(
                element,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          )
          .toList(),
      onExpansionChanged: (value) {
        setState(() {
          expanded = !expanded;
        });
      },
    );
  }
}
