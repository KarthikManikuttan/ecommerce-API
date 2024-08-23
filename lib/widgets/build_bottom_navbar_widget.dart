import 'package:flutter/material.dart';
import '../utils/app_color.dart';
import '../screens/home_page.dart';
import 'build_icon_widget.dart';

class BuildBottomNavbarWidget extends StatefulWidget {
  const BuildBottomNavbarWidget({super.key});

  @override
  State<BuildBottomNavbarWidget> createState() => _BuildBottomNavbarWidgetState();
}

class _BuildBottomNavbarWidgetState extends State<BuildBottomNavbarWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const Center(
      child: Text(
        'Index 1: search',
      ),
    ),
    const Center(
      child: Text(
        'Index 2: favourite',
      ),
    ),
    const Center(
      child: Text(
        'Index 3: profile',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: SizedBox(
          height: 74,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: AppColors().primaryColors,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            unselectedFontSize: 13,
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const BuildIconWidget(
                  imgLink: "https://img.icons8.com/puffy-filled/64/home.png",
                ),
                activeIcon: BuildIconWidget(
                  imgLink: "https://img.icons8.com/puffy-filled/64/home.png",
                  color: AppColors().primaryColors,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: const BuildIconWidget(
                  imgLink:
                      "https://img.icons8.com/external-febrian-hidayat-basic-outline-febrian-hidayat/48/external-search-user-interface-febrian-hidayat-basic-outline-febrian-hidayat.png",
                ),
                activeIcon: BuildIconWidget(
                  imgLink:
                      "https://img.icons8.com/external-febrian-hidayat-basic-outline-febrian-hidayat/48/external-search-user-interface-febrian-hidayat-basic-outline-febrian-hidayat.png",
                  color: AppColors().primaryColors,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: const BuildIconWidget(
                  imgLink: "https://img.icons8.com/ios/50/like--v1.png",
                ),
                activeIcon: BuildIconWidget(
                  imgLink: "https://img.icons8.com/ios-filled/50/like--v1.png",
                  color: AppColors().primaryColors,
                ),
                label: 'Favourites',
              ),
              BottomNavigationBarItem(
                icon: const BuildIconWidget(
                  imgLink: "https://img.icons8.com/pastel-glyph/64/person-male--v2.png",
                  size: 40,
                ),
                activeIcon: BuildIconWidget(
                  imgLink: "https://img.icons8.com/pastel-glyph/64/person-male--v2.png",
                  color: AppColors().primaryColors,
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
