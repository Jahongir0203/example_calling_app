import 'dart:math' as math;
import 'utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

final String userlocalID = math.Random().nextInt(1000).toString();

void main() {
  runApp(MyApp());
}gi

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  final callIDTextCtrl = TextEditingController(text: 'Write calling ID ....');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Expanded(child:
            TextFormField(
              controller: callIDTextCtrl,
              decoration: InputDecoration(
                  labelText: 'Join a call by ID '
              ),
            )
            ),
              ElevatedButton(onPressed:(){Navigator.push(
                  context, MaterialPageRoute(builder: (context) {
                return CallPage(
                    callID:callIDTextCtrl.text
                );
              }
              )
              );
              }, child: Text('Join'))
            ],
          ),
        ),
      ),
    );
  }
}

class CallPage extends StatelessWidget {

  final String callID;
  CallPage({required this.callID});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    ZegoUIKitPrebuiltCall(
      appID:Utils.appId,
      appSign: Utils.appSignin,
      userID:userlocalID ,
      userName:"User_$userlocalID" ,
      callID:callID ,
      config:ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall() ..onOnlySelfInRoom=(context){
        Navigator.of(context).pop();
      },


    ));
  }
}

