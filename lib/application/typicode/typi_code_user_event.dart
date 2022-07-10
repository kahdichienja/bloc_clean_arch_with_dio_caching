part of 'typi_code_user_bloc.dart';

abstract class TypiCodeUserEvent extends Equatable {
  const TypiCodeUserEvent();

  @override
  List<Object> get props => [];
}

class LoadTypiCodeUserEvent extends TypiCodeUserEvent {}