import 'package:flutter/material.dart';
import '../homepage/playlist.dart';
import '../homepage/recently.dart';
import '../homepage/favorites.dart';
import '../homepage/homePage.dart';




// HomePage
class HomeScreenWidget extends StatefulWidget {

  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();

}

class _HomeScreenWidgetState extends State<HomeScreenWidget>{
  int _currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

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
                                style: TextStyle(color: Colors.black),
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
            ]
        ),
        bottomNavigationBar: NavigationBar(
          height: 60,
          onDestinationSelected: (int index){
            setState(() {
              _currentIndex = index;
            });
          },
          indicatorColor: Colors.white24,
          selectedIndex: _currentIndex,
          destinations:const <Widget>[
            //Tab home
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: "Home",
            ),
            //Tab album
            NavigationDestination(
              selectedIcon: Icon(Icons.library_music),
              icon: Icon(Icons.library_music_outlined),
              label: "Album",
            ),
            //Tab profile
            NavigationDestination(
              selectedIcon: Icon(Icons.account_circle),
              icon: Icon(Icons.account_circle_outlined),
              label: "Profile",
            ),
          ],
        ),
        body:const <Widget>[
          HomepageWidget(),
          HomepageWidget(),
          HomepageWidget(),
        ][_currentIndex]
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
