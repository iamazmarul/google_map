import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController? _mapController;
  LocationData? _currentLocation;
  final Location _location = Location();
  final List<LatLng> _polylineCoordinates = [];
  final Set<Polyline> _polylines = {};
  final Set<Marker> _markers = {};
  LatLng? _previousLatLng;

  @override
  void initState() {
    super.initState();
    _initLocationService();
  }

  void _initLocationService() async {
    _location.onLocationChanged.listen((LocationData locationData) {
      _currentLocation = locationData;
      _mapController!.animateCamera(CameraUpdate.newLatLng(
        LatLng(locationData.latitude!, locationData.longitude!),
      ));
      _updateMapLocation();
    });
  }

  void _updateMapLocation() {
    if (_currentLocation != null && _mapController != null) {
      final newLatLng =
          LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!);

      if (_previousLatLng != null) {
        _polylines.add(Polyline(
          polylineId: const PolylineId("polylines"),
          color: Colors.blue,
          width: 3,
          points: [..._polylineCoordinates, newLatLng],
        ));
      }
      _polylineCoordinates.add(newLatLng);

      _markers.add(Marker(
        markerId: const MarkerId("markers"),
        position: newLatLng,
        infoWindow: InfoWindow(
          title: "My Current Location",
          snippet: "Lat: ${newLatLng.latitude} , Lng: ${newLatLng.longitude}",
        ),
      ));

      _previousLatLng = newLatLng;
      _mapController!.animateCamera(CameraUpdate.newLatLng(newLatLng));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Real-Time Location Tracker"),
      ),
      body: GoogleMap(
        initialCameraPosition:
            const CameraPosition(target: LatLng(0, 0), zoom: 15),
        onMapCreated: (controller) {
          _mapController = controller;
        },
        markers: _markers,
        polylines: _polylines,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}