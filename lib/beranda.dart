import 'dart:convert';

import 'package:animated_markers_map_app/pages/map_marker.dart';
import 'package:animated_markers_map_app/screens/CallScreen/call_screen.dart';
import 'package:animated_markers_map_app/screens/VideoCallScreen/videocall_screen.dart';
import 'package:custom_google_map_markers/custom_google_map_markers.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'utils/map_style.dart';

const MARKER_COLOR = Color(0xff00E057);

final _myLocation = LatLng(-6.280325061088294, 106.6618943775601);

class Beranda extends StatefulWidget {
  const Beranda({key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  //-6.2980328,106.6574986,15z

  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(-6.2980328, 106.6574986),
    zoom: 15,
  );

  var _pageController = PageController();
  double page = 0.0;
  int _selectedIndex = 0;

  void _listenScroll() {
    setState(() {
      page = _pageController.page ?? 0;
    });
  }

  List<Marker> _buildMarkers() {
    final _markerList = <Marker>[];
    for (int i = 0; i < mapMarkers.length; i++) {
      final mapItem = mapMarkers[i];
      _markerList.add(
        Marker(
          markerId: MarkerId('Google'),
          draggable: false,
          icon: BitmapDescriptor.fromAsset("assets/marker.png"),
          position: mapItem.location, //LatLng(-6.2980328, 106.6574986), //

          // PageController.jumpTo(i)
          onTap: () {
            // _pageController.animateToPage(
            //   i,
            //   curve: Curves.bounceIn,
            //   duration: const Duration(
            //     milliseconds: 500,
            //   ),
            // );
          },
        ),
      );
    }
    return _markerList;
  }

  // Custom marker icon
  //BitmapDescriptor icon;

  // List for storing markers
  //List<Marker> allMarkers = [];

  @override
  void initState() {
    // _pageController = PageController(
    //   initialPage: 0,
    //   keepPage: true,
    //   viewportFraction: 1.0,
    // );
    _pageController.addListener(_listenScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_listenScroll);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _markers = _buildMarkers();
    // the index of the current page
    int _activePage = 0;
    return Scaffold(
      appBar: AppBar(
        //title: const Text('Animated Markers'),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 51.0),
          //   child: IconButton(
          //     icon: const Icon(Icons.bubble_chart),
          //     onPressed: () => null,
          //   ),
          // ),
          const Padding(
            padding: EdgeInsets.only(right: 57.0),
            child: Center(
              child: Text(
                'Markers Map',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VideoCallScreen(),
                    ),
                  );
                },
                child: const Icon(
                  EvaIcons.videoOutline,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.filter_alt_outlined),
              onPressed: () => null,
            ),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: GoogleMap(
              initialCameraPosition: _initialPosition,
              zoomControlsEnabled: false,
              compassEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                controller.setMapStyle(jsonEncode(mapStyle));
              },
              markers: Set.from(_markers),
            ),
          ),
          // Add a Pageview
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            height: MediaQuery.of(context).size.height * 0.3,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _activePage = page;
                });
              },
              // physics: NeverScrollableScrollPhysics(),
              itemCount: _markers.length,
              itemBuilder: (BuildContext context, int index) {
                final item = mapMarkers[index];
                return _MapItemDetails(
                  mapMarker: item,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _LocationMarker extends StatelessWidget {
  final bool selected;

  const _LocationMarker({Key key, this.selected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        height: 50,
        width: 50,
        duration: const Duration(milliseconds: 400),
        child: Image.asset("assets/marker.png"),
      ),
    );
  }
}

// class _myLocationMarker extends StatelessWidget {
//   const _myLocationMarker({key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       width: 50,
//       decoration: const BoxDecoration(
//         color: MARKER_COLOR,
//         shape: BoxShape.circle,
//       ),
//     );
//   }
// }

class _MapItemDetails extends StatelessWidget {
  final MapMarker mapMarker;

  const _MapItemDetails({Key key, this.mapMarker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _style = TextStyle(color: Colors.grey[800], fontSize: 11);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        margin: EdgeInsets.zero,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset(mapMarker.image),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          mapMarker.title,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          mapMarker.address,
                          style: _style,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          mapMarker.phone,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            MaterialButton(
              padding: EdgeInsets.zero,
              color: MARKER_COLOR,
              elevation: 6,
              child: const Text(
                'CALL',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CallScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
