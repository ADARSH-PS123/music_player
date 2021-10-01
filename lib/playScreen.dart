import 'package:flutter/material.dart';
import 'package:flutter_application_1/appIcon.dart';
import 'package:flutter_application_1/colors.dart' as AppColors;
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/providers/songProvider.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PlayScreen extends StatefulWidget {
  final PanelController? panelController;
  PlayScreen({this.panelController});
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: screenHeight * .09),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                panelController.close();
              },
              child: Icon(
                Icons.arrow_drop_down,
                color: AppColors.textColor,
              ),
            ),
            Text("Now Playing",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'regular',
                  color: AppColors.textColor,
                )),
            Icon(
              Icons.menu,
              color: AppColors.textColor,
            )
          ],
        ),
        SizedBox(
          height: screenHeight * .062,
        ),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(15)),
              margin: EdgeInsets.fromLTRB(
                  screenWidth * .07, 0, screenWidth * 0.07, 0),
              height: screenHeight * .46,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/logo.png',
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: screenHeight * .360,
                width: screenWidth * .86,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    gradient: LinearGradient(
                        colors: [
                          AppColors.backgroundColor.withOpacity(.01),
                          AppColors.backgroundColor.withOpacity(.09),
                          AppColors.backgroundColor.withOpacity(.1),
                          AppColors.backgroundColor.withOpacity(.2),
                          AppColors.backgroundColor.withOpacity(.3),
                          AppColors.backgroundColor.withOpacity(.6),
                          AppColors.backgroundColor.withOpacity(.8),
                          AppColors.backgroundColor.withOpacity(.85),
                          AppColors.backgroundColor.withOpacity(.97),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
              top: screenHeight * .20,
              left: screenWidth * 0.07,
            ),
            Positioned(
              child: Icon(
                Icons.loop,
                color: AppColors.textColor,
              ),
              left: screenWidth * .56,
              top: screenHeight * .39,
            ),
            Positioned(
              child: Icon(Icons.shuffle, color: AppColors.textColor),
              left: screenWidth * .69,
              top: screenHeight * .39,
            ),
            Positioned(
              child: Icon(Icons.favorite, color: AppColors.textColor),
              left: screenWidth * .82,
              top: screenHeight * .39,
            ),
          ],
        ),
        SizedBox(
          height: screenHeight * .03,
        ),
        Padding(
          padding:
              EdgeInsets.only(left: screenWidth * .1, right: screenWidth * .1),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: screenHeight * .03,
              child: Text(
                context.watch<SongProvider>().playingSongDetails(),
                style: TextStyle(color: AppColors.textColor, fontSize: 18),
                maxLines: 1,
              ),
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        Slider(
          max: context.watch<SongProvider>().finalSlider,
          min: 0.0,
          value: context.watch<SongProvider>().slidervalue,
          onChanged: (values) {
            context.read<SongProvider>().slidervalue = values;
            context.read<SongProvider>().seekSong(values.toInt());
          },
          activeColor: AppColors.textColor,
        ),
        Padding(
          padding:
              EdgeInsets.only(left: screenWidth * .1, right: screenWidth * .1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context
                    .watch<SongProvider>()
                    .durationStream()
                    .replaceRange(0, 2, '')
                    .replaceRange(5, 12, ''),
                style: TextStyle(color: AppColors.textColor),
              ),
              Text(
                context
                    .watch<SongProvider>()
                    .getDuration()
                    .replaceRange(0, 2, '')
                    .replaceRange(5, 12, ''),
                style: TextStyle(color: AppColors.textColor),
              )
            ],
          ),
        ),
        SizedBox(
          height: screenHeight * .02,
        ),
        AppIcon()
      ],
    );
  }
}
