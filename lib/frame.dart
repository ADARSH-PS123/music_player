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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Option Name",
                style: TextStyle(fontSize: 23, color: AppColors.textColor),
              ),
              Icon(
                Icons.menu,
                color: AppColors.textColor,
                size: 25,
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: screenWidth * .09,
              right: screenWidth * .09,
              bottom: screenHeight * .02),
          decoration: BoxDecoration(
              color: AppColors.searchColor,
              borderRadius: BorderRadius.circular(15)),
          child: TextField(
            controller: textEditingController,
            onChanged: (value) {
              if (textEditingController.text.isNotEmpty) {
                context.read<SongProvider>().search(value);
                context.read<SongProvider>().textStatus = false;
              } else {
                context.read<SongProvider>().textStatus = true;
                context.read<SongProvider>().getSong();
                debugPrint("???????????????????????");
              }
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
        ),
      ],
    );
  }
}
