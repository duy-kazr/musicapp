import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../homepage/playlist.dart';
import '../homepage/recently.dart';
import '../homepage/favorites.dart';



// HomePage screen
class MusicApp extends StatefulWidget {

  MusicApp({super.key});

  @override
  MusicAppScreen createState() => MusicAppScreen();

}

class MusicAppScreen extends State<MusicApp>{

  MusicAppScreen();

  List<items> itemLst = Items;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            backgroundColor: Colors.black,
            actions: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:  const EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 0),
                      child: Container(
                        height: 46,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(23)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: 250,
                              child: const TextField(
                                //controller: _searchController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintText: 'Search...',
                                  hintStyle: TextStyle(color: Colors.grey), // Thay đổi màu của hintText ở đây
                                ),
                              ),
                            ),
                            Image.asset('assets/icons/search.png'),
                          ],
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/V.jpg'),
                    ),
                  ],
                ),
              )
            ],
          ),
          body: Container(
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
          ),
        ),
      debugShowCheckedModeBanner: false,
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
