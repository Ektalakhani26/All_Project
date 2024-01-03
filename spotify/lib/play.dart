import 'package:flutter/material.dart';
import 'dart:async'; // Add this import for the Timer class
import 'API_Spotify/api.dart'; // Import your API classes

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  // Create a variable to store the currently playing song
  Items? currentlyPlayingSong;

  // Create a timer to simulate song playback (you'll need to replace this with actual audio playback)
  Timer? playbackTimer;

  List<Items> songs = [
    Items(
      name: "Song 1",

      // Add other properties like artists, album, etc.
    ),
    Items(
      name: "Song 2",
      // Add other properties like artists, album, etc.
    ),
    // Add more songs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Currently Playing:',
              style: TextStyle(fontSize: 18),
            ),
            if (currentlyPlayingSong != null)
              Text(
                currentlyPlayingSong!.name ?? '',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            // Add a button to play a song (you can replace this with your UI)
            ElevatedButton(
              onPressed: () {
                // Replace this with your logic to select a song to play
                // Here, I'm just selecting the first item from the list of songs as a placeholder.
                if (songs.isNotEmpty) {
                  final songToPlay = songs.first;
                  // Start playing the selected song
                  playSong(songToPlay);
                }

              },
              child: Text('Play Song'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to start playing a song (simulated)
  void playSong(Items song) {
    // Stop any currently playing song
    stopCurrentSong();

    // Start playing the new song
    setState(() {
      currentlyPlayingSong = song;
    });

    // Simulate playback (replace this with actual audio playback)
    playbackTimer = Timer(Duration(seconds: 5), () {
      stopCurrentSong();
    });
  }

  // Function to stop the currently playing song
  void stopCurrentSong() {
    if (playbackTimer != null && playbackTimer!.isActive) {
      playbackTimer!.cancel();
    }
    setState(() {
      currentlyPlayingSong = null;
    });
  }

  @override
  void dispose() {
    stopCurrentSong(); // Ensure that playback is stopped when the screen is disposed
    super.dispose();
  }
}
