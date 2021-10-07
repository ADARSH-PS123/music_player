import 'package:flutter_application_1/appSearchScreen.dart';
import 'package:flutter_application_1/colors.dart' as AppColors;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/songProvider.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:provider/provider.dart';

class Frame extends StatefulWidget {
  @override
  _FrameState createState() => _FrameState();
}

class _FrameState extends State<Frame> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: screenHeight * .03,
        ),
        Padding(
          padding: EdgeInsets.all(screenWidth * .05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Option Name",
                style: TextStyle(fontSize: 23, color: AppColors.textColor),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppSearchScreen()));
                },
                icon: Icon(
                  Icons.search,
                  size: 25,
                  color: AppColors.textColor,
                ),
              ),
              Icon(
                Icons.menu,
                color: AppColors.textColor,
                size: 25,
              )
            ],
          ),
        ),
      ],
    );
  }
}
