import 'package:flutter/material.dart';

class ContainButtonWidget extends StatelessWidget {
  const ContainButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white24
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: Image.asset("assets/icons/heart-icon-gradient.png", fit: BoxFit.contain,)),
              ),
              const Text("Favorite", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)
            ],
          ),
        ),
        const SizedBox(width: 16,),
        Container(
          height: 100,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white24
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.asset("assets/icons/download-icon.png", fit: BoxFit.contain,)),
              ),
              const Text("Download", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)
            ],
          ),
        ),
        const SizedBox(width: 16,),
        Container(
          height: 100,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white24
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.asset("assets/icons/song-icon.png", fit: BoxFit.contain,)),
              ),
              const Text("Songs", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),)
            ],
          ),
        ),
      ],
    );
  }
}