import 'package:flutter/material.dart';
import 'package:thumbnails_ai/pages/home/homepage.dart';
class splachScreen extends StatefulWidget {
  const splachScreen({Key? key}) : super(key: key);

  @override
  State<splachScreen> createState() => _splachScreenState();
}

class _splachScreenState extends State<splachScreen> {
  @override
  void initState(){
    super.initState();
    //_navigatetohome();
  }
  _navigatetohome()async{
    await Future.delayed(Duration(microseconds: 15000),() {});
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>thumbnailHomePage()));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,

            ),
            Container(
              child: Text('Splach Screen',
              style: TextStyle(fontSize:24,fontWeight: FontWeight.bold ),),

            ),
          ],
        ),
      ),
    );
  }
}
