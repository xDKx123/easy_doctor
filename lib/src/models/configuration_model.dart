import 'package:easy_doctor/src/models/id.dart';
import 'package:equatable/equatable.dart';

class ConfigurationModel extends Equatable {
  const ConfigurationModel(
      {required this.id,
      required this.languageCode,
      required this.chatMessagesPerPage,
      required this.chatPersonsPerPage,
      required this.postsItemsPerPage});

  final ConfigurationID id;
  final String languageCode;
  final int chatPersonsPerPage;
  final int chatMessagesPerPage;
  final int postsItemsPerPage;

  ConfigurationModel copyWith({
    final ConfigurationID? id,
    final String? languageCode,
    final int? chatPersonsPerPage,
    final int? chatMessagesPerPage,
    final int? postsItemsPerPage,
  }) {
    return ConfigurationModel(
        id: id ?? this.id,
        languageCode: languageCode ?? this.languageCode,
        chatPersonsPerPage: chatPersonsPerPage ?? this.chatPersonsPerPage,
        chatMessagesPerPage: chatMessagesPerPage ?? this.chatMessagesPerPage,
        postsItemsPerPage: postsItemsPerPage ?? this.postsItemsPerPage);
  }

  @override
  List<Object?> get props => <Object?>[id, languageCode];
}

class ConfigurationID extends ID {
  const ConfigurationID(String id) : super(id);
}
