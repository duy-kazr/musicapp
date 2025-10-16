import 'package:flutter/material.dart';


class FavoritesWidget extends StatefulWidget {
  @override
  State<FavoritesWidget> createState() => _FavoritesWidgetState();
}


class _FavoritesWidgetState extends State<FavoritesWidget> {

  List<items> itemLst = Items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Your Favorites",
          style: TextStyle( fontSize: 22, fontWeight: FontWeight.w600),),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                    child: Image.asset("assets/images/${itemLst[index].image}", fit: BoxFit.contain,)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 250,
                                      height: 30,
                                      child: Text(itemLst[index].title, style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20
                                      ),),
                                    ),
                                    const Text('Unknowauthor', style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey
                                    ),)
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Image.asset("assets/icons/heart.png")
                                ),
                              )
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