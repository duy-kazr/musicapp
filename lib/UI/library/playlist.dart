import 'package:flutter/material.dart';

class PlaylistWidget extends StatefulWidget {

  @override
  State<PlaylistWidget> createState() => _PlaylistWidgetState();

}

class _PlaylistWidgetState extends State<PlaylistWidget> {

  List<items> itemLst = Items;


  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Playlist",
          style: TextStyle( fontSize: 20, fontWeight: FontWeight.w400),),
        const SizedBox(height: 10,),
        Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
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
                    "assets/icons/plus-icon.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Text("Create a playlist", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),)
            ],
          ),
        ),
        const SizedBox(height: 10,),
        SizedBox(
          height: itemLst.length * 70,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 10,),
            itemCount: itemLst.length,
            itemBuilder: (context, index) {
              return Container(
                  height: 60,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
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
                                    fontWeight: FontWeight.w300
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5.0, top: 5),
                              child: Text(
                                itemLst[index].owner,
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
          ),
        ),
      ],
    );
  }
}



class items {
  late String image;
  late String title;
  late String owner;

  items({required this.image, required this.title, required this.owner});
}
List<items> Items = [items(image: "V.jpg", title: "Playlist1", owner: "username"),
  items(image: "V.jpg", title: "Playlist2", owner: "username"),
  items(image: "V.jpg", title: "Playlist3", owner: "username")
];