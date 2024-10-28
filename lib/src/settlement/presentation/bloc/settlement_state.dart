part of 'settlement_bloc.dart';

sealed class SettlementState extends Equatable {
  const SettlementState();
  
  @override
  List<Object> get props => [];
}

final class SettlementInitial extends SettlementState {}
