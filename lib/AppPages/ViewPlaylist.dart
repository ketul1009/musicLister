import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_lister/AppPages/HomePage.dart';
import '../Models/Song.dart';

class ViewPlaylist extends StatefulWidget{
  const ViewPlaylist({super.key});

  @override
  ViewPlaylistState createState() => ViewPlaylistState();
}

class ViewPlaylistState extends State<ViewPlaylist>{

  String name = selected.name;
  List<Song> songs = selected.songs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Lister"),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    children: const [
                      SizedBox(width: 100,),
                      Padding(
                          padding: EdgeInsets.all(20),
                          child: Text("Playlist Detail", style: TextStyle(fontSize: 20),)
                      )
                    ]
                ),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Text("Name: $name"),
                        Text("Total Songs: ${songs.length}"),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 40,),
                    SizedBox(
                        width: 300,
                        height: 500,
                        child: ListView.builder(
                            itemCount: songs.length,
                            itemBuilder: (BuildContext context, int index){
                              Song song = songs[index];
                              String name = song.name;
                              String artist = song.artist;
                              return Container(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: ListTile(
                                    title: Text(name),
                                    subtitle: Text(artist),
                                  ),
                                ),
                              );
                            })
                    )
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}