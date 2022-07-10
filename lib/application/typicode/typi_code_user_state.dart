part of 'typi_code_user_bloc.dart';

abstract class TypiCodeUserState extends Equatable {
  const TypiCodeUserState();

  @override
  List<Object> get props => [];
}

class TypiCodeUserInitialState extends TypiCodeUserState {}

class TypiCodeUserLoadingState extends TypiCodeUserState {}

class TypiCodeUserLoadedState extends TypiCodeUserState {
  // final List<TestAPIUserModel> apiResult;

  final Either<Failure, List<TestAPIUserModel>> apiResult;

  const TypiCodeUserLoadedState({
    required this.apiResult,
  });
}

class TypiCodeUserErrorState extends TypiCodeUserState {
  final String message;
  const TypiCodeUserErrorState(this.message);
  @override
  List<Object> get props => [message];
}

extension TaskX<T extends Either<Object, U>, U> on Task<T> {
  Task<Either<Failure, U>> mapLeftToFailure() {
    return map(
      (either) => either.leftMap((obj) {
        try {
          return obj as Failure;
        } catch (e) {
          throw obj;
        }
      }),
    );
  }
}

class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}
