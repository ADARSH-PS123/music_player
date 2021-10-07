import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppSearchSpace.dart';
import 'package:flutter_application_1/appListTile.dart';
import 'package:flutter_application_1/colors.dart' as AppColors;
import 'package:flutter_application_1/providers/songProvider.dart';
import 'package:provider/provider.dart';

class AppSearchScreen extends StatefulWidget {
  const AppSearchScreen({Key? key}) : super(key: key);

  @override
  _AppSearchScreenState createState() => _AppSearchScreenState();
}

class _AppSearchScreenState extends State<AppSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              key: PageStorageKey<String>('pageKey'),
              padding: EdgeInsets.only(
                  bottom: screenHeight * .19, top: screenHeight * .002),
              itemBuilder: (
                context,
                index,
              ) {
                return Column(
                  children: [
                    index == 0 ? AppSearchSpace() : SizedBox(),
                    SizedBox(
                      height: screenHeight * .003,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * .01, right: screenWidth * 0.01),
                        child: AppListTile(
                          ontap: () {
                            /*  context.read<SongProvider>().playAudio(index);
                              panelController.open();*/
                          },
                          colorText: AppColors.textColor,
                          text:
                              /*context
                                .watch<SongProvider>()
                                .songInfo[index]
                                .album,*/
                              'aa',
                          colorListTile: AppColors.listTileColor,
                          TitleText: 'tii',
                          /* context.watch<SongProvider>().songInfo[index].title,*/
                          index: index, //index,
                          image: AssetImage('assets/logo.png'),
                          /*context
                                    .watch<SongProvider>()
                                    .songInfo[index]
                                    .albumArtwork ==
                                null
                            ? AssetImage('assets/logo.png')
                            : FileImage(File(context
                                .watch<SongProvider>()
                                .songInfo[index]
                                .albumArtwork)) as ImageProvider*/
                        )),
                  ],
                );
              },
              itemCount: Provider.of<SongProvider>(context).songs.length +
                  1 /* context.watch<SongProvider>().songInfo.length,*/
              ),
        ],
      ),
    );
  }
}
