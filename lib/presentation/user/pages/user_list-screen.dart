
import 'package:blockpatterntest/application/typicode/typi_code_user_bloc.dart';
import 'package:blockpatterntest/model/typicode/user_api_freezed_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestUSerData extends StatelessWidget {
  const TestUSerData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TypiCodeUserBloc, TypiCodeUserState>(
        builder: (context, state) {
          if (state is TypiCodeUserInitialState) {
            context.read<TypiCodeUserBloc>().add(LoadTypiCodeUserEvent());
            return const CircularProgressIndicator();
          } else if (state is TypiCodeUserLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TypiCodeUserLoadedState) {
            return state.apiResult.fold(
              (failure) => Center(child: Text("$failure")),
              (users) => w(users,
                  callback: () async => context
                      .read<TypiCodeUserBloc>()
                      .add(LoadTypiCodeUserEvent())),
            );
          } else if (state is TypiCodeUserErrorState) {
            return Center(
              child: Text("${state.message}"),
            );
          }
          return const Text("Error");
        },
      ),
    );
  }

  Widget w(List<TestAPIUserModel> apiResult,
      {required Future<void> Function() callback}) {
    return RefreshIndicator(
      onRefresh: callback,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            apiResult.length,
            (index) {
              TestAPIUserModel user = apiResult[index];
              return Card(
                child: ListTile(
                  // onTap: () => provider.getUser(user.id!),
                  title: Text(user.name!),
                  subtitle: Text(user.company!.name!),
                  trailing: Text(user.phone!),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
