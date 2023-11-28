import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/datasource/order_remote_datasource.dart';
import 'package:ecommerce_app/data/models/requests/add_address_request_model.dart';
import 'package:ecommerce_app/data/models/responses/add_address_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_address_event.dart';
part 'add_address_state.dart';
part 'add_address_bloc.freezed.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  AddAddressBloc() : super(const _Initial()) {
    on<_AddAddress>((event, emit) async {
      emit(const _Loading());
      final response =
          await OrderRemoteDatasource().addAddress(AddAddressRequestModel(
              data: AddAddress(
        name: event.name,
        address:
            '${event.address}, ${event.subDistrictName}, ${event.cityName}, ${event.provinceName}',
        phone: event.phone,
        provId: event.provinceId,
        cityId: event.cityId,
        subdistrictId: event.subdistrictId,
        zipCode: event.codePos,
        userId: event.userId,
        isDefault: event.isDefault.isEmpty ? false : true,
      )));
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
