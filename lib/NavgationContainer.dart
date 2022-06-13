import 'package:flutter/material.dart';
import 'package:tiktok_clone/pages/add_video_page.dart';
import 'package:tiktok_clone/pages/discover_page.dart';
import 'package:tiktok_clone/pages/home_page.dart';
import 'package:tiktok_clone/pages/inbox_page.dart';
import 'package:tiktok_clone/pages/profile_page.dart';
import 'package:tiktok_clone/widget/custom_bottom_navgation.dart';

class NavgationConatiner extends StatefulWidget {
  const NavgationConatiner({Key? key}) : super(key: key);

  @override
  _NavgationConatinerState createState() => _NavgationConatinerState();
}

class _NavgationConatinerState extends State<NavgationConatiner> {
  int _selectedPageIndex = 0;

  static const List<Widget> _page = [
    HomePage(),
    DiscoverPage(),
    AddVideoPage(),
    InboxPage(),
    ProfilePage()
  ];

  void _onIconTapper (int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _page[_selectedPageIndex],
      ),
      bottomNavigationBar: CustomBottomNavgationBar(
       selectedPageIndex: _selectedPageIndex,
        onIconTap: _onIconTapper,

      ),

    );
  }
}
