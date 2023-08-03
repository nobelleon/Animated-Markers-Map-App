import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const MARKER_COLOR = Color(0xff00E057);

class MapMarker {
  final String image;
  final String title;
  final String address;
  final String phone;
  final LatLng location;
  final Container container;

  MapMarker({
    this.image,
    this.title,
    this.address,
    this.phone,
    this.location,
    this.container,
  });
}

final _locations = [
  const LatLng(-6.281210720812967, 106.66373996241829), // Pizza
  const LatLng(-6.280304984295466, 106.66190852899511), // McDonalds
  const LatLng(-6.283078136402386, 106.66453777659709), // Midori
  const LatLng(-6.285215407374897, 106.66513024780397), // Starbucks
  const LatLng(-6.279161424968968, 106.66298541119106), // KFC
  const LatLng(-6.294324826442136, 106.64040688083232), // J.CO DONUTS
  const LatLng(-6.27226872841514, 106.65643989059117), // Nasi Kapau Sakato
  const LatLng(-6.273057909130595, 106.64234220001539), // Sogogi Shabu
  const LatLng(-6.237496793108195, 106.6314197526474), // ABUBA Steak
  const LatLng(-6.29965563135901, 106.66958026956317), // Pempek Kenari
];

final _myLocationMarker = Container(
  height: 50,
  width: 50,
  decoration: const BoxDecoration(
    color: MARKER_COLOR,
    shape: BoxShape.circle,
  ),
);

const _marker = 'assets/marker.png';

final mapMarkers = [
  MapMarker(
    image: 'assets/logo_pizza_hut.png', //${_marker}logo_pizza_hut.png',
    title: 'Pizza Hut Restoran',
    address:
        'BSD Ruko Plaza Sektor VII, Jl. Pahlawan Seribu No.48, Lengkong Wetan, Kec. Serpong, Kabupaten Tangerang',
    phone: 'Hub: 08113249438',
    location: _locations[0],
    container: _myLocationMarker,
  ),
  MapMarker(
    image: 'assets/logo_McDonalds.png', //${_marker}logo_McDonalds.png',
    title: 'McDonalds - BSD City',
    address:
        'Jl. Pahlawan Seribu No.12, Lengkong Wetan, Kec. Serpong, Kota Tangerang Selatan',
    phone: 'Hub: 14045',
    location: _locations[1],
    container: _myLocationMarker,
  ),
  MapMarker(
    image: 'assets/logo_midori.png', // '${_marker}logo_midori.png',
    title: 'Midori',
    address: 'Lengkong Wetan, Kec. Serpong, Kota Tangerang Selatan',
    phone: 'Hub: 0215386897',
    location: _locations[2],
    container: _myLocationMarker,
  ),
  MapMarker(
    image: 'assets/logo_Starbucks.png', //'${_marker}logo_Starbucks.png',
    title: 'Starbucks BSD',
    address:
        'Jl. Pahlawan Seribu No.100 C, Lengkong Wetan, Kec. Serpong, Kota Tangerang Selatan',
    phone: 'Hub: 02155695001',
    location: _locations[3],
    container: _myLocationMarker,
  ),
  MapMarker(
    image: 'assets/logo_KFC.png', //'${_marker}logo_KFC.png',
    title: 'KFC - BSD',
    address: 'Jalan BUMI SERPONG DAMAI SEKTOR IV, Lengkong Wetan, Kec. Serpong',
    phone: 'Hub: 02153154916',
    location: _locations[4],
    container: _myLocationMarker,
  ),
  MapMarker(
    image: 'assets/logo_J.co.png', //'${_marker}logo_J.co.png',
    title: 'J.CO DONUTS & COFFEE',
    address: 'Foresta Business Loft 1 Unit 25/26, BSD City, Jl. BSD Raya Utama',
    phone: 'Hub: 081288008990',
    location: _locations[5],
    container: _myLocationMarker,
  ),
  MapMarker(
    image:
        'assets/logo_nasi_kapau_sakato.png', //'${_marker}logo_nasi_kapau_sakato.png',
    title: 'Nasi Kapau Sakato',
    address:
        'Ruko Villa Melati Mas Blok SR1 No.14, Jelupang, Kec. Serpong Utara, Kota Tangerang Selatan',
    phone: 'Hub: 08119455545',
    location: _locations[6],
    container: _myLocationMarker,
  ),
  MapMarker(
    image:
        'assets/logo_Sogogi Shabu & Grill.png', //'${_marker}logo_Sogogi Shabu & Grill.png',
    title: 'Sogogi Shabu & Grill',
    address:
        'Jl. Springs Boulevard, Cihuni, Kec. Pagedangan, Kabupaten Tangerang',
    phone: 'Hub: 0895603416667',
    location: _locations[7],
    container: _myLocationMarker,
  ),
  MapMarker(
    image: 'assets/logo_ABUBA Steak.png', //'${_marker}logo_ABUBA Steak.png',
    title: 'ABUBA Steak - Serpong',
    address:
        'Jl. Boulevard Raya Blok BAIV No. 37-39, Pakulonan Bar., Kec. Klp. Dua, Kabupaten Tangerang',
    phone: 'Hub: 02154205212',
    location: _locations[8],
    container: _myLocationMarker,
  ),
  MapMarker(
    image:
        'assets/logo_Pempek Kenari.jpg', //'${_marker}logo_Pempek Kenari.jpg',
    title: 'Pempek Kenari - BSD',
    address:
        'Ruko Anggrek Loka Blok AH2, Jl. Boulevard BSD Tim. No.5D, Rawa Buntu, Serpong Sub-District',
    phone: 'Hub: 081995778822',
    location: _locations[9],
    container: _myLocationMarker,
  ),
];
