import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/providers/appData.dart';

import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:just_audio/just_audio.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class SongProvider with ChangeNotifier {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  final audioPlayer = AudioPlayer();
  int songIndex = 0;
  bool playStatus = false;
  bool firstPlay = false;
  Duration duration = Duration(seconds: 0);
  double slidervalue = 0;
  double finalSlider = 0;

  List<SongInfo> songInfo = [];
  List<SongInfo> songs = [];
  bool textStatus = true;

  TextEditingController textController = TextEditingController();
  indexFromData() async {
    int? index = await AppData().getIndex();
    index == null ? songIndex = 0 : songIndex = index;
  }

  playAudio(index) async {
    songIndex = index;
    AppData().setIndex(songIndex);
    await audioPlayer.setUrl(songInfo[songIndex].uri);
    audioPlayer.play();
    playStatus = true;
    notifyListeners();
    debugPrint("playAudio called");
  }

  playAudio1() async {
    indexFromData();
    if (firstPlay) {
      //play remaing part of audio
      audioPlayer.play();
      playStatus = true;

      notifyListeners();
    } else {
      //play from begining
      await audioPlayer.setUrl(songInfo[songIndex].uri);
      audioPlayer.play();
      playStatus = true;
      firstPlay = true;

      notifyListeners();
    }
  }

  skipSong(bool value) async {
    if (value) {
      try {
        songIndex++;
        AppData().setIndex(songIndex);
        await audioPlayer.setUrl(songInfo[songIndex].uri);
        audioPlayer.play();
        playStatus = true;
        firstPlay = true;
        notifyListeners();
      } catch (e) {
        await audioPlayer.setUrl(songInfo[songInfo.length - 1].uri);
        audioPlayer.play();
      }
    } else {
      try {
        songIndex--;
        AppData().setIndex(songIndex);
        await audioPlayer.setUrl(songInfo[songIndex].uri);
        audioPlayer.play();
        playStatus = true;
        firstPlay = true;
        notifyListeners();
      } catch (e) {
        AppData().getIndex();
        await audioPlayer.setUrl(songInfo[songIndex].uri);
        audioPlayer.play();
        playStatus = true;
      }
    }
  }

  String playingSongDetails() {
    try {
      return songInfo[songIndex].title.toString();
    } catch (e) {
      if (songIndex < 0) {
        return songInfo[0].title.toString();
      } else if (songIndex > songInfo.length) {
        return songInfo[songInfo.length - 1].title.toString();
      } else {
        return "searching";
      }
    }
  }

  pauseAudio() {
    audioPlayer.pause();
    playStatus = false;
    notifyListeners();
  }

  getSong() async {
    if (textStatus) {
      songInfo = await audioQuery.getSongs();
      notifyListeners();
    }
  }

  String getDuration() {
    duration = audioPlayer.duration ?? Duration(seconds: 0);
    finalSlider = audioPlayer.duration != null
        ? audioPlayer.duration!.inSeconds.toDouble()
        : 0;
    return duration.toString();
  }

  String durationStream() {
    Duration? duration1;
    duration1 = audioPlayer.position;
    slidervalue = duration1.inSeconds.toDouble();
    return duration1.toString();
  }

  seekSong(value) {
    audioPlayer.seek(Duration(seconds: value));
  }

  search(String value) {
    songs = songInfo;
    songInfo = songInfo.where((element) {
      final searchName = value.toLowerCase();
      final songName = element.title.toLowerCase();
      return songName.contains(searchName);
    }).toList();

    debugPrint(value + ":::::");

    notifyListeners();
  }
}
