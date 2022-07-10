import 'package:blockpatterntest/application/typicode/typi_code_user_bloc.dart';
import 'package:blockpatterntest/domain/typicode/repository/i_user_repository.dart';
import 'package:blockpatterntest/presentation/typicode/pages/user_list-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => TypiCodeUserBloc(IUserRepository()),
        child: const TestUSerData(),
      ),
    );
  }
}
