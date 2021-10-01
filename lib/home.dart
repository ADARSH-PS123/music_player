import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/appIcon.dart';
import 'package:flutter_application_1/colors.dart' as AppColors;
import 'package:flutter_application_1/frame.dart';
import 'package:flutter_application_1/playScreen.dart';
import 'package:flutter_application_1/providers/songProvider.dart';
import 'package:flutter_application_1/songList.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

int index = 0;
PanelController panelController = new PanelController();

class _HomeState extends State<Home> {
  Widget screens() {
    switch (index) {
      case 0:
        return SongList(
          panelController: panelController,
        );
      case 1:
        return Frame();
      default:
        return SongList(
          panelController: panelController,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double ScreenHeight = MediaQuery.of(context).size.height;
    final double ScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF293241),
      bottomNavigationBar: BottomNavyBar(
          backgroundColor: AppColors.backgroundColor,
          selectedIndex: index,
          items: [
            BottomNavyBarItem(
                inactiveColor: AppColors.searchColor,
                icon: Icon(
                  Icons.music_note,
                  color: AppColors.textColor,
                ),
                title: Text(
                  "Songs",
                  style: TextStyle(color: AppColors.textColor),
                )),
            BottomNavyBarItem(
                inactiveColor: AppColors.searchColor,
                icon: Icon(Icons.playlist_play, color: AppColors.textColor),
                title: Text("")),
            BottomNavyBarItem(
                inactiveColor: AppColors.searchColor,
                icon: Icon(
                  Icons.list,
                  color: AppColors.textColor,
                ),
                title: Text("")),
            BottomNavyBarItem(
                inactiveColor: AppColors.searchColor,
                icon: Icon(
                  Icons.article_sharp,
                  color: AppColors.textColor,
                ),
                title: Text("")),
          ],
          onItemSelected: (currentIndex) {
            setState(() {
              index = currentIndex;
            });
          }),
      body: SlidingUpPanel(
        controller: panelController,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(29), topRight: Radius.circular(29)),
        color: AppColors.backgroundColor,
        minHeight: ScreenHeight * .09,
        maxHeight: ScreenHeight,
        panel: PlayScreen(
          panelController: panelController,
        ),
        collapsed: Stack(
          children: [
            Positioned(
              child: AppIcon(),
              top: ScreenHeight * .01,
              left: ScreenWidth * .05,
            ),
            Positioned(
              child: Text(
                context.watch<SongProvider>().playingSongDetails(),
                style: TextStyle(color: AppColors.textColor),
                maxLines: 1,
              ),
              top: ScreenHeight * .03,
              left: ScreenWidth * .40,
              right: ScreenWidth * .1,
            )
          ],
        ),
        body: screens(),
      ),
    );
  }
}
