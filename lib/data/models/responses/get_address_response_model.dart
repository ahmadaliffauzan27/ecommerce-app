import 'dart:convert';

class GetAddressResponsesModel {
  final List<GetAddress> data;
  final Meta meta;

  GetAddressResponsesModel({
    required this.data,
    required this.meta,
  });

  factory GetAddressResponsesModel.fromJson(String str) =>
      GetAddressResponsesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAddressResponsesModel.fromMap(Map<String, dynamic> json) =>
      GetAddressResponsesModel(
        data: List<GetAddress>.from(
            json["data"].map((x) => GetAddress.fromMap(x))),
        meta: Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "meta": meta.toMap(),
      };
}

class GetAddress {
  final int id;
  final Attributes attributes;

  GetAddress({
    required this.id,
    required this.attributes,
  });

  factory GetAddress.fromJson(String str) =>
      GetAddress.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetAddress.fromMap(Map<String, dynamic> json) => GetAddress(
        id: json["id"],
        attributes: Attributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes.toMap(),
      };
}

class Attributes {
  final String name;
  final String address;
  final String phone;
  final String provId;
  final String cityId;
  final String subdistrictId;
  final String zipCode;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final bool isDefault;

  Attributes({
    required this.name,
    required this.address,
    required this.phone,
    required this.provId,
    required this.cityId,
    required this.subdistrictId,
    required this.zipCode,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.isDefault,
  });

  factory Attributes.fromJson(String str) =>
      Attributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attributes.fromMap(Map<String, dynamic> json) => Attributes(
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        provId: json["prov_id"],
        cityId: json["city_id"],
        subdistrictId: json["subdistrict_id"],
        zipCode: json["zip_code"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        isDefault: json["is_default"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "address": address,
        "phone": phone,
        "prov_id": provId,
        "city_id": cityId,
        "subdistrict_id": subdistrictId,
        "zip_code": zipCode,
        "user_id": userId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "is_default": isDefault,
      };
}

class Meta {
  final Pagination pagination;

  Meta({
    required this.pagination,
  });

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromMap(json["pagination"]),
      );

  Map<String, dynamic> toMap() => {
        "pagination": pagination.toMap(),
      };
}

class Pagination {
  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  factory Pagination.fromJson(String str) =>
      Pagination.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pagination.fromMap(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
