import 'package:flutter/material.dart';
import 'package:zoomclone3/resources/auth_method.dart';
import 'package:zoomclone3/screens/auth/meeting_screen.dart';
import 'package:zoomclone3/screens/history_metting_screen.dart';
import 'package:zoomclone3/screens/joint_meeting_screen.dart';
import 'package:zoomclone3/utils/colors.dart';
import 'package:zoomclone3/widgets/custome_button.dart';
import 'package:zoomclone3/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
static String screenName ='/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;



  List<Widget> _pages = [
    MeetingScreen(),
    HistoryMettingScreen(),
    JointMeetingScreen(),
    Container(child: Center(child: Text("4")),),
    Padding(
      padding: const EdgeInsets.all(18),
      child: Center(child: CustomeButton(textname: 'Logout', onpressed: ()=> AuthMethod().signOut() )),
    ),

  ];

  pageChange(int index){
  setState(() {
      _pageIndex = index;
  });  
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Meet & Chat'),
          centerTitle: true,
          backgroundColor: background,
        ),
        body: _pages[_pageIndex] ,
        bottomNavigationBar: BottomNavigationBar(
          
            backgroundColor: footercolor,
            selectedItemColor: Colors.green.shade300,
            unselectedItemColor:  Colors.grey,
            onTap: pageChange,
            currentIndex: _pageIndex,
            type: BottomNavigationBarType.fixed,
            unselectedFontSize: 14,
          items: [
          BottomNavigationBarItem( icon: Icon(Icons.comment_bank,), label: 'Meet & Char'),
          BottomNavigationBarItem( icon: Icon(Icons.lock_clock,), label: 'Meetings'),
          BottomNavigationBarItem( icon: Icon(Icons.person_outline), label: 'Contacts'),
          BottomNavigationBarItem( icon: Icon(Icons.settings_outlined), label: 'Settings'),
          BottomNavigationBarItem( icon: Icon(Icons.comment_bank_sharp), label: 'Meet &  Char'),
        ])
      ),
    );
  }
}