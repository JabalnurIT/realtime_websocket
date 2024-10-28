import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settlement_event.dart';
part 'settlement_state.dart';

class SettlementBloc extends Bloc<SettlementEvent, SettlementState> {
  SettlementBloc() : super(SettlementInitial()) {
    on<SettlementEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
