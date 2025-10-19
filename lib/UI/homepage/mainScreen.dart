import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../homepage/homePage.dart';
import '../homepage/miniPlayer.dart';





// HomePage
class HomeScreenWidget extends StatefulWidget {

  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();

}

class _HomeScreenWidgetState extends State<HomeScreenWidget>{
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    List<Widget> _pages = const [
      HomepageWidget(),
      HomepageWidget(),
      HomepageWidget(),
    ];

    final model = Provider.of<MusicPlayerModel>(context);
    final miniPlayerHeight = model.currentSong != null ? 68.0 : 0.0;
    final contentMiniPlayerHeight = miniPlayerHeight;

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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
            items: const [
            //Tab home
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            //Tab album
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music_outlined),
              label: "Album",
            ),
            //Tab profile
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: "Profile",
            ),
            ]
          ),
          body: Stack(
            children:[
              Padding(
                padding: EdgeInsets.only(
                  bottom: contentMiniPlayerHeight
                ),
                child: IndexedStack(
                  index: _currentIndex,
                  children: _pages,
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: model.currentSong != null
                  ? MiniPlayer()
                  : const SizedBox.shrink(),
              )
            ]
          ),
        ),
        debugShowCheckedModeBanner: false,
    );
  }
}
