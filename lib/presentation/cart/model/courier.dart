// ignore_for_file: public_member_api_docs, sort_constructors_first
class Courier {
  final String kode;
  final String name;

  Courier({
    required this.kode,
    required this.name,
  });

  @override
  String toString() => name;
}

List<Courier> couriers = [
  Courier(kode: 'jne', name: 'JNE'),
  Courier(kode: 'pos', name: 'POS'),
  Courier(kode: 'jnt', name: 'J&T'),
];

// kode subdistrict origin
const String subDistrictOrigin = '1501';
