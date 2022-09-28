import 'package:flutter/material.dart';
import 'package:zoomclone3/resources/auth_method.dart';
import 'package:zoomclone3/widgets/custome_button.dart';
import 'package:zoomclone3/widgets/vertical_space.dart';

import '../../assistant/assistant.dart';

class LoginScreen extends StatefulWidget {
const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    final AuthMethod _authMethod = AuthMethod();

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
       
        body: Padding(

          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Start or join meeting', style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),),
              VerticalSpace(value: 24),

              Image.asset(Asset().imagePath('onboarding.jpg')),
              
              VerticalSpace(value: 31),
              CustomeButton(textname: 'Google Sign In', onpressed: ()async{
                  bool res =  await _authMethod.signInWithGoogle(context);
                  if(res){
                      Navigator.pushNamed(context, '/home');
                  }
              })
            ],
          ),
        ),
      ),
    );
  }
}