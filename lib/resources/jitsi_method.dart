import 'package:flutter/material.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoomclone3/resources/auth_method.dart';
import 'package:zoomclone3/resources/firestore_method.dart';

class JitsiMethod {
final AuthMethod _authMethod =  AuthMethod();
final FirestoreMethod _firestoremethod = FirestoreMethod();

void createMeeting({required String roomName, required bool isAudioMuted ,required bool isVideoMmmuted, String username =''}) async {

try {
	  FeatureFlag featureFlag = FeatureFlag();
	  featureFlag.welcomePageEnabled = false;
    
    
	  featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION; // Limit video resolution to 360p
	  

        String name;
    if(username.isEmpty){
        name =  _authMethod.user.displayName!;
    }else{
    name = username;

    }

      var options = JitsiMeetingOptions(
        room: roomName
      )
        ..userDisplayName = name
        ..userEmail = _authMethod.user.email
        ..userAvatarURL = _authMethod.user.photoURL // or .png
        ..audioOnly = true
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMmmuted;

      _firestoremethod.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
}

}