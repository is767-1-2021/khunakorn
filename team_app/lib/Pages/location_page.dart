import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';



class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final Completer<GoogleMapController> _controller = Completer();
  late LocationData currentLocation;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.74700, 100.53906),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Location'),
        //automaticallyImplyLeading: false,
      ),
      body: GoogleMap(
        markers: {
          Marker(
              markerId: MarkerId("1"),
              position: LatLng(13.74700, 100.53906),
              
              infoWindow:
                  InfoWindow(title: "You Here", snippet: "XXXXXX"),
              //icon: _markerIcon,
              visible: true
              // onTap: () =>
              //     _openOnGoogleMapApp(13.653296334116222, 100.41089676426907)
              ),
      
          Marker(
              markerId: MarkerId("2"),
              position: LatLng(13.75027, 100.54006),
              infoWindow:
                  InfoWindow(title: "2", snippet: "XXXXXX"),
              //icon: _markerIcon,
              visible: true,
              //onTap: () =>
              //_openOnGoogleMapApp(13.653296334116222, 100.41089676426907)
              ),
          
          Marker(
              markerId: MarkerId('3'),
              
              position: LatLng(13.74643, 100.53476),
              infoWindow:
                  InfoWindow(title: "3", snippet: "XXXXXX",
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => MovedCat()),
                      
                  );
              },
              
              //icon: _markerIcon,
              //visible: true,
              
              
              
              
              //     _openOnGoogleMapApp(13.653296334116222, 100.41089676426907)
            ),
          ),
        },
        compassEnabled: true,
        myLocationButtonEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _openOnGoogleMapApp(13.74700, 100.53906);
        },
        label: const Text(
          'Change Location',
          style:
              TextStyle(fontFamily: 'BaiJamjuree', fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.pin_drop_outlined),
        //backgroundColor: Colors.teal.withOpacity(0.95),
      ),
    );
  }

  _openOnGoogleMapApp(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      // Could not open the map.
    }
  }
}


class MovedCat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'Cat',
            child: Image.asset(
              'pic/deal1.png',
              width: 350,
            ),
          ),
        ),
      ),
    );
  }
}