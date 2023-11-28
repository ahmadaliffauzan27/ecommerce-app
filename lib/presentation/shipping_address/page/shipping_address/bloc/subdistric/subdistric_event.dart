part of 'subdistric_bloc.dart';

@freezed
class SubdistricEvent with _$SubdistricEvent {
  const factory SubdistricEvent.started() = _Started;
  const factory SubdistricEvent.getAllByCityId(String city) = _GetAllByCityId;
}
