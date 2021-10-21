import 'package:flutter/material.dart';
import 'package:mlsa_amu/models/event_details.dart';
import 'package:mlsa_amu/utils/size_config.dart';

class Expansion_Tile extends StatefulWidget {
  bool isExpanded;
  ExpansionTileDetails expansionTileDetails;
  Expansion_Tile(
      {required this.isExpanded, required this.expansionTileDetails});

  @override
  _Expansion_TileState createState() => _Expansion_TileState();
}

class _Expansion_TileState extends State<Expansion_Tile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        widget.expansionTileDetails.personTypeName,
        style: TextStyle(
          fontSize: SizeConfig.baseFontSize * 5,
        ),
      ),
      leading: Icon(widget.expansionTileDetails.icon, color: Colors.white),
      textColor: Colors.white,
      collapsedTextColor: Colors.white,
      trailing: Container(
        width: SizeConfig.screenHeight * 0.04,
        height: SizeConfig.screenHeight * 0.04,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          widget.isExpanded
              ? Icons.keyboard_arrow_up_outlined
              : Icons.keyboard_arrow_down_outlined,
          color: Colors.black,
        ),
      ),
      children: widget.expansionTileDetails.personType
          .map((sponsor) => Text(
                sponsor,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white),
              ))
          .toList(),
      onExpansionChanged: (value) {
        setState(() {
          widget.isExpanded = !widget.isExpanded;
        });
      },
    );
  }
}
