import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

class ListenPage extends StatefulWidget {
  @override
  _ListenPageState createState() => _ListenPageState();
}

class _ListenPageState extends State<ListenPage> {

  LocationData currentLocation ;

  var location = new Location();

  @override
  Future initState()  {
    _getLocationd().then((data){
      setState(() {
        currentLocation =data;
      });
    });
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          currentLocation == null
              ? CircularProgressIndicator()
              : Text("Location:" + "${currentLocation.latitude}" + "${currentLocation.longitude}" ),
        ],
      ),
    );
  }
  Future<LocationData> _getLocationd() async {
    try {
      LocationData a;
      a = await location.getLocation();
      return a;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print(e);
      }
      currentLocation = null;
    }
  }
}