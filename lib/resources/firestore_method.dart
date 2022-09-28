import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreMethod {

final FirebaseFirestore _firestore =  FirebaseFirestore.instance;
final FirebaseAuth _auth =  FirebaseAuth.instance;

Stream<QuerySnapshot<Map<String, dynamic>>> get meetingsHistory => _firestore.collection('users').doc(_auth.currentUser!.uid).collection('meetings').snapshots();

  void addToMeetingHistory(String meetingNamme)async{
    try{
      await _firestore.collection('users').doc(_auth.currentUser!.uid).collection('meetings').add({
        'meetingName': meetingNamme,
        'created_at': DateTime.now(), 

      });
    }catch(e){
      print(e);
    }
  }

}