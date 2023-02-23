import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/Screens/HomeScreen/modal/HomeModal.dart';

class HomeProvider extends ChangeNotifier {
  // only variable
  bool play = false;
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  List<HomeModal> MusicList = [
    HomeModal(
        m_name: "Pahela Pyar",
        m_artist: "Armaan Malik",
        m_image: "asset/image/1.jpg",
        m_audio: "asset/audio/1.mp3",
        m_play: false,
        i: 0,
        color: Colors.amber.shade900),
    HomeModal(
        m_name: "Dil Diyan Gallan",
        m_artist: "Atif Aslam",
        m_image: "asset/image/2.jpg",
        m_audio: "asset/audio/2.mp3",
        m_play: false,
        i: 1,
        color: Colors.amber.shade700),
    HomeModal(
        m_name: "Namo Namo",
        m_artist: "Amit Trivedi",
        m_image: "asset/image/3.jpeg",
        m_audio: "asset/audio/3.mp3",
        m_play: false,
        i: 2,
        color: Colors.amber.shade500),
    HomeModal(
        m_name: "Faded",
        m_artist: "Alan Walker",
        m_image: "asset/image/4.jpg",
        m_audio: "asset/audio/4.mp3",
        m_play: false,
        i: 3,
        color: Colors.amber.shade400),
    HomeModal(
        m_name: "On My Way",
        m_artist: "Alan Walker",
        m_image: "asset/image/4.jpg",
        m_audio: "asset/audio/4.mp3",
        m_play: false,
        i: 4,
        color: Colors.amber.shade200),
  ];
  String songpath = "asset/audio/1.mp3";
  Duration songduration = Duration(seconds: 0, hours: 0, minutes: 0);
  HomeModal? h1;
  bool on = true;
  bool sound = true;

  void ch(val) {
    play = val;
    notifyListeners();
  }

  void Data(HomeModal hh) {
    h1 = hh;
    notifyListeners();
  }

  void changevalue(value, index) {
    MusicList[index].m_play = value;
    print(index);
    notifyListeners();
  }

  void onoff(value) {
    on = value;
    notifyListeners();
  }

  void changesongpath(value) {
    songpath = value;
    notifyListeners();
  }

  void Music() {
    audioPlayer.open(
      Audio(
        "$songpath",
      ),
      showNotification: true,
      autoStart: play,
    );
    SongDuration();
    //play=true;
    notifyListeners();
  }

  void SongDuration() {
    audioPlayer.current.listen((event) {
      songduration = event!.audio.duration;
    });
  }

  void SongSound() {
    if (sound) {
      audioPlayer.setVolume(1.0);
    } else {
      audioPlayer.setVolume(0.0);
    }
    notifyListeners();
  }

  void HeadPhone() {
    sound = !sound;
    notifyListeners();
  }
}
