import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_lister/Models/Playlist.dart';
import 'package:music_lister/main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Playlist selected = Playlist("", []);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{

  void _logOut() async {
    SharedPreferences pref =await SharedPreferences.getInstance();
    pref.setBool("session", false);
  }

  @override
  Widget build(BuildContext context) {
    PlaylistProvider playlistProvider = context.watch<PlaylistProvider>();
    Playlist playlist = playlistProvider.playlist;
    final screenWidth = MediaQuery.of(context).size.width;
    final multiplier = screenWidth > 600 ? 1.0 : 0.1;
    int serialNo = 1;
    return Scaffold(
        appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.all(5),
              child: TextButton(
                onPressed: (){
                  _logOut();
                  context.go("/");
                },
                child: const Text("Log out"),
              )
          ),
          Padding(
              padding: const EdgeInsets.all(5),
              child: TextButton(
                onPressed: (){
                  context.go("/account");
                },
                child: const Text("Account"),
              )
          ),
        ],
      ),
        resizeToAvoidBottomInset: true,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.go("/create");
          },
          child: const Icon(CupertinoIcons.plus),
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
                          child: Text("Playlists", style: TextStyle(fontSize: 20),)
                      )
                    ]
                ),
                Row(
                  children: [
                    const SizedBox(width: 40,),
                    SizedBox(
                      width: 300,
                      height: 500,
                      child: ListView.builder(
                          itemCount: playlists.length,
                          itemBuilder: (BuildContext context, int index){
                            Playlist playlist = playlists.elementAt(index);
                            String name = playlist.name;
                            String songs = playlist.songs.length.toString();
                            return Container(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blueAccent),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: ListTile(
                                  onTap: (){
                                    selected = playlists.elementAt(index);
                                    context.go('/view');
                                  },
                                  title: Text(name),
                                  subtitle: Text("Total songs : $songs"),
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