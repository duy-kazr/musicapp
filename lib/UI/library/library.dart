import 'package:flutter/material.dart';

import '../library/playlist.dart';
import '../library/containButton.dart';
import 'package:musicapp/UI/homepage/recently.dart';


class LibraryWidget extends StatefulWidget {
  @override
  State<LibraryWidget> createState() => _LibraryWidgetState();
}

class _LibraryWidgetState extends State<LibraryWidget> {



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const ContainButtonWidget(),
            RecentlyWidget(),
            PlaylistWidget(),
          ],
        ),
      ),
    );
  }
}
