import 'package:flutter/material.dart';


class FavoritesWidget extends StatelessWidget {

  List<items> itemLst = Items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Your Favorites",
          style: TextStyle( fontSize: 28, fontWeight: FontWeight.w600),),
        SizedBox(
          height: itemLst.length*92,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: itemLst.length,
            itemBuilder: (BuildContext context, int index) {
              return
                Container(
                  height: 92,
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