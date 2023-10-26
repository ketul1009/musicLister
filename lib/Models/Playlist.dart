import 'package:flutter/cupertino.dart';

import 'Song.dart';

class Playlist{
  String name;
  List<Song> songs;

  Playlist(this.name, this.songs);

}

class PlaylistProvider with ChangeNotifier{
  Playlist _playlist;
  PlaylistProvider(this._playlist);

  Playlist get playlist => _playlist;

  void setWatchlist(Playlist playlist){
    _playlist = playlist;
    notifyListeners();
  }
}