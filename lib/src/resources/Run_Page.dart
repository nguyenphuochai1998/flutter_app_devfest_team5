import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';



class RunPage extends StatefulWidget{
  RunPage({Key key, this.title}) : super(key: key);
  final String title;



  @override
  _RunPage createState() => _RunPage();
}
class _RunPage extends State<RunPage> {
  LocationData currentLocation ;

  var location = new Location();




//  CameraPosition _kGooglePlex;
  Completer<GoogleMapController> _controllerMap = Completer();
  @override
  void initState() {
    print("mappppp");
    _getLocationd().then((data){
      setState(() {
        currentLocation =data;
        print(currentLocation.longitude);
      });
    });









    super.initState();
  }





  Widget build(BuildContext context) {

    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: currentLocation == null? CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962),
          zoom: 14.4746,
        ):CameraPosition(
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          zoom: 14.4746,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,



        onMapCreated: (GoogleMapController controller) {
          _controllerMap.complete(controller);
        },
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