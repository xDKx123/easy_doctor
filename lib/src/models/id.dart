import 'package:equatable/equatable.dart';

class ID extends Equatable {
  const ID(this.id);

  final String id;

  @override
  List<Object?> get props => <Object>[id];

  @override
  String toString() => id;

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    return other is ID && other.id == id;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => id.hashCode;
}
