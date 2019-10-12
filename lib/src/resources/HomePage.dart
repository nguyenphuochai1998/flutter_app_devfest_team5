import 'package:flutter/material.dart';
import 'package:flutter_app_devfest_team5/src/resources/Run_Page.dart';

import 'package:flutter_app_devfest_team5/src/resources/test_page.dart';
class HomePage extends StatefulWidget{
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePage createState() => _HomePage();
}
class _HomePage extends State<HomePage> {
//  AuthGetBloc _getAuth = new AuthGetBloc();
//  FireCloud _cloud =new FireCloud();

  @override
  void dispose() {
//    _getAuth.dispoise();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
//    _getAuth.getD();
//    _getAuth.getDataUserAuth();
    // TODO: implement initStat
    super.initState();
  }

//  final Future<FirebaseUser> Auth = FirebaseAuth.instance.currentUser();
  String id;
  var services = [
    "Run 4 Earth",
    "Your Qr Code",
    "Sorting Garbage",
    "Friends"
  ];
  var icon = [
    "Images/Icon_Run.png",
    "Images/Icon_Qrcode.png",
    "Images/Icon_Recycling.png",
    "Images/Icon_Friends.png"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,

        body: new Stack(
          children: <Widget>[
            TopTagHomePage(),
            Container(
              margin: EdgeInsets.only(top: MediaQuery
                  .of(context)
                  .size
                  .height / 3),
              child: MenuHome(),
            )
          ],
        )
    );
  }

  Widget TopTagHomePage() {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height / 3,
      decoration: BoxDecoration(

          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF45BC5F), Color(0xFF5DEA7C)]

          ),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(120.0))
      ),
      child: Row(

        children: <Widget>[
          new Container(
              margin: EdgeInsets.all(20.0),
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.white),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(""))
              )
          ),
          new Column(
            children: <Widget>[
              new Container(
                margin: EdgeInsets.only(top: 90.0, bottom: 20.0),
                child: BuildName(),
              ),
              new Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 4 * 2.2,
                child: InformationUser(),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget InformationUser() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        buildIcon(Colors.deepPurpleAccent, Icons.directions_run, '0 km'),
        buildIcon(Colors.deepOrange, Icons.restore_from_trash, '0point'),
        buildIcon(Colors.white, Icons.star, 'lever 0')
//        new StreamBuilder(
////          stream: _getAuth.runStream,
//          builder: (context,snap){
//            print(snap);
//            return buildIcon(Colors.deepPurpleAccent, Icons.directions_run, '${snap.data} km');
//          },
//        ),
//        new StreamBuilder(
////          stream: _getAuth.pointStream,
//          builder: (context,snap){
//            print(snap);
//            return buildIcon(Colors.deepOrange, Icons.restore_from_trash, '${snap.data} point' );
//          },
//        ),
//        new StreamBuilder(
////          stream: _getAuth.vlStream,
//          builder: (context,snap){
//            print(snap);
//            return buildIcon(Colors.white, Icons.star, 'lever ${snap.data}');
//          },
//        ),

      ],
    );
  }

  Widget buildIcon(Color _color, IconData _icon, String _text) {
    return new Column(
      children: <Widget>[
        new Icon(_icon, color: _color, size: 35.0,),
        new Text(_text, style: TextStyle(color: _color),)
      ],
    );
  }

  Widget BuildName() {
    return StreamBuilder(
//            stream: _getAuth.nameStream,
      builder: (context, snap) {
        return Text('Hi ${snap.data}!!',
          style: TextStyle(color: Colors.white, fontSize: 28.0),);
      },
    );
  }

  Widget MenuHome() {
    return GridView.builder(

        itemCount: icon.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                MenuHomeOnTap(index);
              },
              child: Card(
                color: Colors.lightBlueAccent,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Image.asset(icon[index], height: 70.0, width: 70.0,),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(services[index], style: new TextStyle(
                          fontSize: 16,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                          color: Colors.white), textAlign: TextAlign.center,),
                    )
                  ],
                ),
              )
          );
        }
    );
  }


  void MenuHomeOnTap(int index) {
    switch (index) {
      case 0 :
        {
          ///run
          Navigator.push(context, MaterialPageRoute(builder: (context)=>RunPage()));
        }
        break;
      case 1 :
        {
          ///qr
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ListenPage()));

        }
        break;
      case 2 :
        {
          /// khi bam vao Sorting Garbage

        }
        break;
      case 3 :
        {
          /// khi bam vao friends

        }
        break;
      default:
        {
          print("Invalid choice");
        }
        break;
    }
  }
}
