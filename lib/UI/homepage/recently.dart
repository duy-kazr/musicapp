import 'package:flutter/material.dart';

class RecentlyWidget extends StatefulWidget{

  @override
  State<RecentlyWidget> createState() => _RecentlyWidgetState();

}

class _RecentlyWidgetState extends State<RecentlyWidget> {

  List<items> itemLst = Items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Recently play",
          style: TextStyle( fontSize: 20, fontWeight: FontWeight.w400),),
        SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemLst.length,
            itemBuilder: (BuildContext context, int index) {
              return
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(34),
                      color: Colors.transparent
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                              child: Image.asset("assets/images/${itemLst[index].image}", fit: BoxFit.contain,)),
                        ),
                      ),
                      Text(
                        itemLst[index].title,
                        maxLines: 1,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w300,
                          fontSize: 18
                      ),)
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