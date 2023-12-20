import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Map"),
        backgroundColor: Colors.blueAccent,
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          zoom: 17,
          bearing: 0,
          target: LatLng(22.710361, 90.363845),
        ),
        zoomGesturesEnabled: false,
        compassEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: <Marker>{
          Marker(
            markerId: const MarkerId("initialPosition2"),
            position: const LatLng(22.710361, 90.363845),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            infoWindow: const InfoWindow(
                title: "Cicada Solutions", snippet: "IT Company"),
            draggable: true,
          ),
          Marker(
            markerId: const MarkerId("initialPosition"),
            position: const LatLng(22.715527, 90.374472),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            infoWindow:
                const InfoWindow(title: "Pixel Tech", snippet: "IT Company"),
            draggable: true,
          ),
        },
        polylines: {
          const Polyline(polylineId: PolylineId("line"),
              color: Colors.red,
              width: 3,
              patterns: [
                PatternItem.dot,
              ],
              points: [
            LatLng(22.710361, 90.363845),
            LatLng(22.715527, 90.374472),
          ])
        },
        polygons: {
          const Polygon(
            polygonId: PolygonId("test"),
            visible: true,
            fillColor: Colors.orange,
            strokeColor: Colors.red,
            strokeWidth: 6,

            points: [
              LatLng(22.710361, 90.363845),
              LatLng(22.715527, 90.374472),
              LatLng(22.716834, 90.373489),
              LatLng(22.711932, 90.379227),
            ]
          ),
        },
        circles: {
          Circle(
            circleId: CircleId("test2"),
            center: LatLng(22.715527, 90.374472),
            radius: 100,
            fillColor: Colors.blueAccent.shade400,
            strokeColor: Colors.green,
            strokeWidth: 5,
            consumeTapEvents: true,
            onTap: (){
              print("Circle");
            }
          )
        },
      ),
    );
  }
}
