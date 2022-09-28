import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoomclone3/resources/firestore_method.dart';

class HistoryMettingScreen extends StatelessWidget {
const HistoryMettingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){


    return StreamBuilder(
      stream: FirestoreMethod().meetingsHistory,
      builder: (context, snapshot){
        if(snapshot.connectionState ==  ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }

        return ListView.builder( 
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context,index) => ListTile(
          title: Text('Room Name ${(snapshot.data! as dynamic).docs[index]['meetingName']}') ,
          subtitle: Text('Joined on ${DateFormat.yMMMMd().format((snapshot.data! as dynamic).docs[index]['created_at'].toDate() )}  ' )  ,
        ));

    });
  }
}