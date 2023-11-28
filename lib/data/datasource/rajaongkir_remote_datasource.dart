import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/common/constants/variables.dart';
import 'package:ecommerce_app/data/models/responses/city_response_model.dart';
import 'package:ecommerce_app/data/models/responses/cost_response_model.dart';
import 'package:ecommerce_app/data/models/responses/province_response_model.dart';
import 'package:ecommerce_app/data/models/responses/subdistrict_response_model.dart';
import 'package:ecommerce_app/data/models/responses/waybill_failed_response_model.dart';
import 'package:ecommerce_app/data/models/responses/waybill_success_response_model.dart';
import 'package:http/http.dart' as http;

class RajaOngkirRemoteDatasource {
  Future<Either<String, ProvinceResponseModel>> getProvince() async {
    final response = await http.get(
      Uri.parse(
        'https://pro.rajaongkir.com/api/province',
      ),
      headers: {
        'key': Variables.keyRajaOngkir,
      },
    );
    if (response.statusCode == 200) {
      return right(ProvinceResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }

  //get city
  Future<Either<String, CityResponseModel>> getCity({
    required String provinceId,
  }) async {
    final response = await http.get(
      Uri.parse(
        'https://pro.rajaongkir.com/api/city?province=$provinceId',
      ),
      headers: {
        'key': Variables.keyRajaOngkir,
      },
    );
    if (response.statusCode == 200) {
      return right(CityResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }

  //get subdistrict
  Future<Either<String, SubDistrictResponseModel>> getSubdistrict({
    required String cityId,
  }) async {
    final response = await http.get(
      Uri.parse(
        'https://pro.rajaongkir.com/api/subdistrict?city=$cityId',
      ),
      headers: {
        'key': Variables.keyRajaOngkir,
      },
    );
    if (response.statusCode == 200) {
      return right(SubDistrictResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }

  //get cost
  Future<Either<String, CostResponsesModel>> getCost(
    String origin,
    String destination,
    String courier,
  ) async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/cost');
    final response = await http.post(
      url,
      headers: {
        'key': Variables.keyRajaOngkir,
        'content-type': 'application/x-www-form-urlencoded',
      },
      body: {
        'origin': origin,
        'originType': 'subdistrict',
        'destination': destination,
        'destinationType': 'subdistrict',
        'weight': '1000',
        'courier': courier,
      },
    );
    if (response.statusCode == 200) {
      return right(CostResponsesModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }

  Future<Either<WaybillFailedResponsesModel, WaybillSuccessResponsesModel>>
      getWaybill(
    String waybill,
    String courier,
  ) async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/waybill');
    final response = await http.post(
      url,
      headers: {
        'key': Variables.keyRajaOngkir,
        'content-type': 'application/x-www-form-urlencoded',
      },
      body: {
        'waybill': waybill,
        'courier': courier,
      },
    );
    if (response.statusCode == 200) {
      return right(WaybillSuccessResponsesModel.fromJson(response.body));
    } else {
      return left(WaybillFailedResponsesModel.fromJson(response.body));
    }
  }
}
