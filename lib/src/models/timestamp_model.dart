import 'package:equatable/equatable.dart';

class TimestampModel extends Equatable {
  const TimestampModel({
    required this.nanos,
    required this.seconds,
  });

  final int nanos;
  final int seconds;

  @override
  List<Object?> get props => [nanos, seconds];
}
