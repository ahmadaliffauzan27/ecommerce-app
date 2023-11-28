import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/common/constants/variables.dart';
import 'package:ecommerce_app/data/datasource/auth_local_datasource.dart';
import 'package:ecommerce_app/data/models/requests/add_address_request_model.dart';
import 'package:ecommerce_app/data/models/requests/order_request_model.dart';
import 'package:ecommerce_app/data/models/responses/add_address_response_model.dart';
import 'package:ecommerce_app/data/models/responses/buyer_order_response_model.dart';
import 'package:ecommerce_app/data/models/responses/get_address_response_model.dart';
import 'package:ecommerce_app/data/models/responses/order_detail_response_model.dart';
import 'package:ecommerce_app/data/models/responses/order_response_model.dart';
import 'package:http/http.dart' as http;

class OrderRemoteDatasource {
  Future<Either<String, OrderResponseModel>> order(
      OrderRequestModel request) async {
    final token = await AuthLocalDataSource().getToken();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/orders'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: request.toJson(),
    );

    if (response.statusCode == 200) {
      return right(OrderResponseModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }

  Future<Either<String, OrderDetailResponseModel>> getOrderById(
      String id) async {
    final token = await AuthLocalDataSource().getToken();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/orders/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return right(OrderDetailResponseModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }

  // add address
  Future<Either<String, AddAddressResponsesModel>> addAddress(
      AddAddressRequestModel request) async {
    final token = await AuthLocalDataSource().getToken();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/addresses'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: request.toJson(),
    );

    if (response.statusCode == 200) {
      return right(AddAddressResponsesModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }

  // get address
  Future<Either<String, GetAddressResponsesModel>> getAddress() async {
    final token = await AuthLocalDataSource().getToken();
    final user = await AuthLocalDataSource().getUser();
    final response = await http.get(
      Uri.parse(
          '${Variables.baseUrl}/api/addresses?filters[user_id][\$eq]=${user.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return right(GetAddressResponsesModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }

  // get order by id
  Future<Either<String, BuyerOrderResponsesModel>> getOrderByBuyerId() async {
    final token = await AuthLocalDataSource().getToken();
    final user = await AuthLocalDataSource().getUser();
    final response = await http.get(
      Uri.parse(
          '${Variables.baseUrl}/api/orders?filters[buyerId][\$eq]=${user.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return right(BuyerOrderResponsesModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }
}
