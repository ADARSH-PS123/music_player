import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors.dart' as AppColors;
import 'package:flutter_application_1/providers/songProvider.dart';
import 'package:flutter_application_1/songList.dart';
import 'package:provider/provider.dart';

class AppIcon extends StatefulWidget {
  @override
  _AppIconState createState() => _AppIconState();
}

class _AppIconState extends State<AppIcon> {
  @override
  void initState() {
    context.read<SongProvider>().indexFromData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
            onTap: () {
              context.read<SongProvider>().skipSong(false);
            },
            child: Icon(
              Icons.skip_previous_rounded,
              size: 24,
              color: AppColors.textColor,
            )),
        context.watch<SongProvider>().playStatus
            ? InkWell(
                onTap: () {
                  context.read<SongProvider>().pauseAudio();
                },
                child: Icon(
                  Icons.pause_circle_rounded,
                  color: AppColors.textColor,
                  size: 40,
                ),
              )
            : InkWell(
                onTap: () {
                  context.read<SongProvider>().playAudio1();
                },
                child: Icon(
                  Icons.play_arrow_rounded,
                  size: 40,
                  color: AppColors.textColor,
                )),
        InkWell(
            onTap: () {
              context.read<SongProvider>().skipSong(true);
            },
            child: Icon(
              Icons.skip_next_rounded,
              size: 24,
              color: AppColors.textColor,
            )),
      ],
    );
  }
}
