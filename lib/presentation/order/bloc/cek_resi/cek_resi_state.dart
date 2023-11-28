part of 'cek_resi_bloc.dart';

@freezed
class CekResiState with _$CekResiState {
  const factory CekResiState.initial() = _Initial;
  const factory CekResiState.loading() = _Loading;
  const factory CekResiState.loaded(WaybillSuccessResponsesModel data) =
      _Loaded;
  const factory CekResiState.error(WaybillFailedResponsesModel error) = _Error;
}
