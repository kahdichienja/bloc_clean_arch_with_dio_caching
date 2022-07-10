import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:blockpatterntest/domain/typicode/repository/i_user_repository.dart';
import 'package:blockpatterntest/model/typicode/user_api_freezed_model.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

part 'typi_code_user_event.dart';
part 'typi_code_user_state.dart';

class TypiCodeUserBloc extends Bloc<TypiCodeUserEvent, TypiCodeUserState> {
  final IUserRepository apiTestRepo;

  TypiCodeUserBloc(
    this.apiTestRepo,
  ) : super(TypiCodeUserInitialState()) {
    on<TypiCodeUserEvent>(
      (event, emit) async {
        if (event is LoadTypiCodeUserEvent) {
          emit(TypiCodeUserLoadingState());
          
          try {
            
            Either<Failure, List<TestAPIUserModel>>? apiResult = await apiTestRepo.getAllUsers();
            emit(TypiCodeUserLoadedState(apiResult: apiResult!));
         
          } catch (e) {
            if (e is SocketException) {
              emit(const TypiCodeUserErrorState('Networ error'));
            }else if(e is FormatException){
              emit(const TypiCodeUserErrorState('Data not in the right format error'));
            }else{
              emit(const TypiCodeUserErrorState('something is not right ..'));
            }
          }
        }
      },
    );
  }
}
