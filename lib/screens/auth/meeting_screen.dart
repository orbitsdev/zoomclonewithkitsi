import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoomclone3/resources/jitsi_method.dart';
import 'package:zoomclone3/widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
 MeetingScreen({ Key? key }) : super(key: key);


final JitsiMethod _jitsiMethod = JitsiMethod(); 
createNewMeeting() async{
  var random = Random();
  String roomName = (random.nextInt(10000000) + 10000000).toString();
  
  _jitsiMethod.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMmmuted: true);
}

joinMeeting(BuildContext context){
  Navigator.pushNamed(context, '/videocall');  
}

  @override
  Widget build(BuildContext context){
    return Container(child:
      Column(
          children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButton(onpressed: createNewMeeting, text: 'New Meeting', icon: Icons.videocam),
              HomeMeetingButton(onpressed: () => joinMeeting(context), text: 'Join Meeting', icon: Icons.add_box_rounded),
              HomeMeetingButton(onpressed: (){}, text: 'Schedule', icon: Icons.calendar_today),
              HomeMeetingButton(onpressed: (){}, text: 'Share Screen'  , icon: Icons.arrow_upward_rounded),
            ],
           ) ,
           const Expanded(child: Center(child: Text('Create/Joing Meetinbgs with just a click', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
           ),),)),
          ],
        ),);
  }
}