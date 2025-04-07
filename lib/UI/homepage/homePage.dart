import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Your Playlist', style:  TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10,),
                //PLaylist
                Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 3
                      ),
                      itemCount: itemLst.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 60,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width:  60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12), // Bo góc của ảnh
                                  child: Image.asset(
                                    "assets/images/V.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 5.0, top: 3),
                                      child: Text(
                                        itemLst[index].title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 5.0, top: 5),
                                      child: Text(
                                        itemLst[index].author,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.white24
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        );
                      },
                    )
                ),
                //Recently play
                const Text("Recently play", style:  TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,),
                ),
                const SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: itemLst.length,
                    itemBuilder: (BuildContext context, int index) {
                      return
                          Container(
                            height: 125,
                            width: 125,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(34),
                              color: Colors.transparent
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Card(
                                    child: Image.asset("assets/images/${itemLst[index].image}", fit: BoxFit.contain,),
                                  ),
                                ),
                                Text(itemLst[index].title, style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16
                                ),)
                              ],
                            ),
                          );
                    },
                  )
                ),
                const Text("Your Favorites", style:  TextStyle(
                   fontSize: 28,
                   fontWeight: FontWeight.w600,),
                 ),
                 Expanded(
                     child: ListView.builder(
                       physics: const NeverScrollableScrollPhysics(),
                       itemCount: itemLst.length,
                       itemBuilder: (BuildContext context, int index) {
                         return
                           Container(
                             height: 80,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(34),
                                 color: Colors.transparent
                             ),
                             child: Column(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(top: 12),
                                   child: Row(
                                       children: [
                                         SizedBox(
                                             height: 80,
                                             width: 80,
                                             child: Image.asset("assets/images/${itemLst[index].image}", fit: BoxFit.contain,)
                                         ),
                                         Text(itemLst[index].title, style: const TextStyle(
                                             fontWeight: FontWeight.w500,
                                             fontSize: 16
                                         ),)
                                       ]
                                     ),
                                 ),
                               ],
                             ),
                           );
                       },
                     )
                 ),
              ],
            ),
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
