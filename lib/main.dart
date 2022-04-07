import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Zoom Caller'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   String _zoomMeetingId = "";
   String _zoomMeetingPassword = "";


   _makePhoneCall(String meetingId,String Password)  {
     if(_zoomMeetingId.isNotEmpty && _zoomMeetingPassword.isNotEmpty ){
       String prefix = "tel:";
       String waitChars = ",,,";
       String endChar = "#";
       print("here");
       launch(prefix+"+914464802722"+waitChars+meetingId+endChar+waitChars+endChar+waitChars+Password+endChar);
       _zoomMeetingId ="";
       _zoomMeetingPassword ="";
     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Zoom meeting number',
                  hintText: 'Enter meeting number'
                ),
                onChanged: (text){
                  _zoomMeetingId =text;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Zoom meeting passcode',
                    hintText: 'Enter meeting passcode'
                ),
                onChanged: (text){
                  _zoomMeetingPassword =text;
                },
              ),
            ),
            RaisedButton(
              child: Text("Join"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: (){
                  String prefix = "tel:";
                  String waitChars = ",,,";
                  String endChar = "#";
                  print("here");
                  launch(prefix+"+914464802722"+waitChars+_zoomMeetingId+endChar+waitChars+endChar+waitChars+_zoomMeetingPassword+endChar);
                }//_makePhoneCall(_zoomMeetingId,_zoomMeetingPassword)
            )
          ],
        ),
      )
    );
  }
}
