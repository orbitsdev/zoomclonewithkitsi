import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoomclone3/resources/auth_method.dart';
import 'package:zoomclone3/screens/auth/login_screen.dart';
import 'package:zoomclone3/screens/home_screen.dart';
import 'package:zoomclone3/screens/video_call_sreen.dart';
import 'package:zoomclone3/utils/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ZoomClone3());
}



class ZoomClone3 extends StatelessWidget {
const ZoomClone3({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZOOM CLONE',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: background
      ),
      home: StreamBuilder(
        stream: AuthMethod().authChange,
        builder: (contex, snapshot){
          if(snapshot.connectionState ==ConnectionState.waiting){
            return  Center(child: CircularProgressIndicator(),);
          } 

          if(snapshot.hasData){
              return HomeScreen();
          }

          return LoginScreen();
        },
      ),
      routes: {
        '/login' : (context)=>  LoginScreen(),
        '/home' : (context)=>  HomeScreen(),
        '/videocall' : (context)=>  VideoCallSreen(),
      },
    );
  }
}



