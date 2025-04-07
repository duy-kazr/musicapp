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
        const Text("Your playlist",
          style: TextStyle( fontSize: 28, fontWeight: FontWeight.w600),),
        SizedBox(
          height: 150,
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
          ),
        ),
      ],
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