import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/datasource/rajaongkir_remote_datasource.dart';
import 'package:ecommerce_app/data/models/responses/waybill_failed_response_model.dart';
import 'package:ecommerce_app/data/models/responses/waybill_success_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cek_resi_event.dart';
part 'cek_resi_state.dart';
part 'cek_resi_bloc.freezed.dart';

class CekResiBloc extends Bloc<CekResiEvent, CekResiState> {
  CekResiBloc() : super(const _Initial()) {
    on<_GetCekResi>((event, emit) async {
      emit(const _Loading());
      final response = await RajaOngkirRemoteDatasource()
          .getWaybill(event.resi, event.courier);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
