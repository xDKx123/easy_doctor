import 'package:easy_doctor/src/models/id.dart';
import 'package:equatable/equatable.dart';

class ConfigurationModel extends Equatable {
  const ConfigurationModel({required this.id, required this.languageCode});

  final ConfigurationID id;
  final String languageCode;

  ConfigurationModel copyWith({
    final ConfigurationID? id,
    final String? languageCode,
  }) {
    return ConfigurationModel(
        id: id ?? this.id, languageCode: languageCode ?? this.languageCode);
  }

  @override
  List<Object?> get props => <Object?>[id, languageCode];
}

class ConfigurationID extends ID {
  const ConfigurationID(String id) : super(id);
}
