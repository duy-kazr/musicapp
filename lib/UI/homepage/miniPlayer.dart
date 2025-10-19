import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Song {
  final String image;
  final String title;
  final String artis;

  Song({required this.image, required this.title, required this.artis});
}

List<Song> Items = [Song(image: "V.jpg", title: "Playlist1", artis: "username"),
  Song(image: "V.jpg", title: "Playlist2", artis: "username"),
  Song(image: "V.jpg", title: "Playlist3", artis: "username")
];

// Build logic when changing music, all listener will be changed
class MusicPlayerModel extends ChangeNotifier {
  Song? _currentsong;
  bool _isPlaying = false;

  int _currentTrackIndex = 0;

  MusicPlayerModel() {
    _currentsong = Items[_currentTrackIndex];
  }

  Song? get currentSong => _currentsong;
  bool get isPlaying => _isPlaying;

  void PauseButton() {
    if(_currentsong == null) return;
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void SkipNext() {
    _currentTrackIndex = (_currentTrackIndex + 1) % Items.length;
    _currentsong = Items[_currentTrackIndex];
    if(!_isPlaying) _isPlaying = true;
    notifyListeners();
  }

  void SkipPrevious() {
    _currentTrackIndex = (_currentTrackIndex - 1 + Items.length) % Items.length;
    _currentsong = Items[_currentTrackIndex];
    if(!_isPlaying) _isPlaying = true;
    notifyListeners();
  }
}

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});


  @override
  Widget build(BuildContext context) {
    // Listen MusicPlayerModel for update
    final model = Provider.of<MusicPlayerModel>(context);
    final song = model.currentSong;

    // Hide if no song is loaded
    if( song == null){
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: () {
        // Navigate to a full-screen player or show a modal
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Opening Full Player Screen...')),
        );
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            //Image of Song
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset("assets/images/${song.image}", fit: BoxFit.fill,)
              ),
            ),
            const SizedBox(width: 10,),

            // Song info
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    song.artis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              )
            ),

            // Control buttton
            IconButton(
              onPressed: model.SkipPrevious,
              icon: const Icon(Icons.skip_previous_outlined)
            ),

            IconButton(
              onPressed: model.PauseButton,
              icon: Icon(
                model.isPlaying ? Icons.pause_circle_outline : Icons.play_circle_outline,
                size: 24,
              )
            ),

            IconButton(
                onPressed: model.SkipNext,
                icon: const Icon(Icons.skip_next_outlined)
            ),
          ],
        ),
      ),
    );
  }
}