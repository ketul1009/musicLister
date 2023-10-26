import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_lister/Common/Toast.dart';
import 'package:music_lister/Models/Playlist.dart';
import 'package:music_lister/Models/Song.dart';
import 'package:music_lister/main.dart';

class CreatePlaylistPage extends StatefulWidget {
  @override
  _CreatePlaylistPageState createState() => _CreatePlaylistPageState();
}

class _CreatePlaylistPageState extends State<CreatePlaylistPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController composerController = TextEditingController();
  final TextEditingController musicLinkController = TextEditingController();
  final TextEditingController playlistTitleController = TextEditingController();
  Playlist playlist = Playlist("", []);
  bool added = false;
  // Function to handle adding a song to the playlist
  void addSongToPlaylist() {
    String playlistName = playlistTitleController.text;
    String title = titleController.text;
    String composer = composerController.text;
    String musicLink = musicLinkController.text;
    if(playlistName.isEmpty || title.isEmpty || composer.isEmpty || musicLink.isEmpty){
      const ToastWidget(message: "Please fill all the fields");
    }
    else{
      playlist.name=playlistName;
      playlist.songs.add(Song(title, composer, musicLink));
      playlists.add(playlist);
      titleController.clear();
      composerController.clear();
      musicLinkController.clear();
      playlistTitleController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Lister'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("Create Playlist", style: TextStyle(fontSize: 20),),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: playlistTitleController,
                decoration: const InputDecoration(labelText: 'Playlist Name'),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                const Text("Songs", style: TextStyle(fontSize: 20),),
                const SizedBox(width: 30,),
                TextButton(onPressed: (){}, child: Text("+ Add new songs"))
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Song Title'),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: composerController,
                decoration: InputDecoration(labelText: 'Composer'),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: musicLinkController,
                decoration: InputDecoration(labelText: 'Music Link'),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: addSongToPlaylist,
              child: const Text('Add to Playlist'),
            ),
          ],
        ),
      ),
    );
  }
}
