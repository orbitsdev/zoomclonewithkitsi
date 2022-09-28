import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoomclone3/resources/auth_method.dart';
import 'package:zoomclone3/resources/jitsi_method.dart';
import 'package:zoomclone3/utils/colors.dart';
import 'package:zoomclone3/widgets/meeting_option.dart';
import 'package:zoomclone3/widgets/vertical_space.dart';

class VideoCallSreen extends StatefulWidget {
  const VideoCallSreen({ Key? key }) : super(key: key);

  @override
  _VideoCallSreenState createState() => _VideoCallSreenState();
}

class _VideoCallSreenState extends State<VideoCallSreen> {
  final AuthMethod _authMethod =  AuthMethod();
  late TextEditingController mettingIdController;
  late TextEditingController namecontroller;
  final JitsiMethod _jitsimethd = JitsiMethod();
  
  @override
  void initState() {
    mettingIdController =  TextEditingController();
    namecontroller =  TextEditingController(text: _authMethod.user.displayName);
    super.initState();
  }
bool isAudioMuted = true;
bool isVideoMuted = true;

  

  

  _joinMeeting(){

  _jitsimethd.createMeeting(roomName: mettingIdController.text, isAudioMuted: isAudioMuted, isVideoMmmuted: isVideoMuted, username: namecontroller.text);

  }

  @override
  void dispose() {
    mettingIdController.dispose();
    namecontroller.dispose();
    JitsiMeet.removeAllListeners();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=>  FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Join a Meeting', style: TextStyle(fontSize: 18),),
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              VerticalSpace(value: 12),
              SizedBox(
                height: 60,
                child: TextField(
                  controller: mettingIdController,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: secondaryBackgroundColor,
                    filled: true,
                    border: InputBorder.none,
                    hintText: 'Room ID'
                  ),
                ),
              ),
              
              SizedBox(
                height: 60,
                child: TextField(
                  controller: namecontroller,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: secondaryBackgroundColor,
                    filled: true,
                    border: InputBorder.none,
                    hintText: 'Name'
                  ),
                ),
              ),
            VerticalSpace(value: 20),
            InkWell(
              onTap: _joinMeeting,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text('Join', style: TextStyle(fontSize: 16),),
              ),
            ),
            VerticalSpace(value: 20),
            MeetingOption(text: 'Mute Audio', isMute: isAudioMuted, onChange: onAudioMuted),
            MeetingOption(text: 'Turn Off Video', isMute: isVideoMuted, onChange: onVideoMuted),

            ],
          ),
        ),
      ),
    );
  }

  onAudioMuted(bool val){
    setState(() {
      isAudioMuted = val;
    });
  }
  onVideoMuted(bool val){
    setState(() {
      isVideoMuted = val;
    });
  }
}