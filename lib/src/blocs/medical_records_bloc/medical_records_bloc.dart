import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'medical_records_event.dart';
part 'medical_records_state.dart';

class MedicalRecordsBloc
    extends Bloc<MedicalRecordsEvent, MedicalRecordsState> {
  MedicalRecordsBloc() : super(MedicalRecordsInitial()) {
    on<MedicalRecordsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
