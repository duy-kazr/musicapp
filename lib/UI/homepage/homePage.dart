import 'package:flutter/material.dart';
import '../homepage/playlist.dart';
import '../homepage/recently.dart';
import '../homepage/favorites.dart';



// HomePage screen
class HomepageWidget extends StatefulWidget {

  const HomepageWidget({super.key});

  @override
  State<HomepageWidget> createState() => _HomepageWidgetState();

}

class _HomepageWidgetState extends State<HomepageWidget>{
  List<items> itemLst = Items;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
            padding: const EdgeInsets.only(left: 25, top: 30, right: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PlaylistWidget(),
                  RecentlyWidget(),
                  FavoritesWidget()
                ],
              ),
            )
          );
  }
}



class items {
  late String image;
  late String title;
  late String author;

  items({required this.image, required this.title, required this.author});
}
List<items> Items = [items(image: "V.jpg", title: "Chaos", author: "Kiiva"),
  items(image: "V.jpg", title: "Brain Power", author: "Nova"),
  items(image: "V.jpg", title: "Anima", author: "V.I")
];
