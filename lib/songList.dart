import 'dart:io';
import 'package:flutter_application_1/appListTile.dart';
import 'package:flutter_application_1/frame.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/providers/songProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/colors.dart' as AppColors;
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SongList extends StatefulWidget {
  final PanelController panelController;
  SongList({required this.panelController});
  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  @override
  Widget build(BuildContext context) {
    context.read<SongProvider>().getSong();
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.height;

    return context.watch<SongProvider>().songInfo.isNotEmpty
        ? Container(
            child: ListView.builder(
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
                    index == 0 ? Frame() : SizedBox(),
                    SizedBox(
                      height: screenHeight * .003,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * .01, right: screenWidth * 0.01),
                        child: AppListTile(
                          ontap: () {
                            context.read<SongProvider>().playAudio(index);
                            panelController.open();
                          },
                          colorText: AppColors.textColor,
                          text: context
                              .watch<SongProvider>()
                              .songInfo[index]
                              .album,
                          colorListTile: AppColors.listTileColor,
                          TitleText: context
                              .watch<SongProvider>()
                              .songInfo[index]
                              .title,
                          index: index,
                          image: context
                                      .watch<SongProvider>()
                                      .songInfo[index]
                                      .albumArtwork ==
                                  null
                              ? AssetImage('assets/logo.png')
                              : FileImage(File(context
                                  .watch<SongProvider>()
                                  .songInfo[index]
                                  .albumArtwork)) as ImageProvider,
                        )),
                  ],
                );
              },
              itemCount: context.watch<SongProvider>().songInfo.length,
            ),
          )
        : Center(
            child: CircularProgressIndicator(
              color: AppColors.textColor,
            ),
          );
  }
}
