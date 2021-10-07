import 'package:flutter_application_1/colors.dart' as AppColors;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/songProvider.dart';
import 'package:provider/provider.dart';

class AppSearchSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
          left: screenWidth * .09,
          right: screenWidth * .09,
          bottom: screenHeight * .01,
          top: screenHeight * .046),
      decoration: BoxDecoration(
          color: AppColors.listTileColor,
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        onChanged: (value) {
          Provider.of<SongProvider>(context).search(value);
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "    Search...",
            hintStyle: TextStyle(color: AppColors.textColor, fontSize: 16),
            suffixIcon: InkWell(
              child: Icon(
                Icons.search,
                color: AppColors.textColor,
              ),
            )),
      ),
    );
  }
}
