import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/datasource/rajaongkir_remote_datasource.dart';
import 'package:ecommerce_app/data/models/responses/subdistrict_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subdistric_event.dart';
part 'subdistric_state.dart';
part 'subdistric_bloc.freezed.dart';

class SubdistricBloc extends Bloc<SubdistricEvent, SubdistricState> {
  SubdistricBloc() : super(const _Initial()) {
    on<_GetAllByCityId>((event, emit) async {
      emit(const _Loading());
      final response = await RajaOngkirRemoteDatasource().getSubdistrict(
        cityId: event.city,
      );
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.rajaongkir.results)),
      );
    });
  }
}
