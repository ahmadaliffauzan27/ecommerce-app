part of 'subdistric_bloc.dart';

@freezed
class SubdistricState with _$SubdistricState {
  const factory SubdistricState.initial() = _Initial;
  const factory SubdistricState.loading() = _Loading;
  const factory SubdistricState.loaded(List<SubDistrict> subdistricts) =
      _Loaded;
  const factory SubdistricState.error(String message) = _Error;
}
