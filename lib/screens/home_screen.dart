import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vacabulary_bloc_https/cubit/dictionary_cubit.dart';
import 'package:vacabulary_bloc_https/screens/list_screen.dart';
import 'package:vacabulary_bloc_https/widgets/get_dictionary_form.dart';
import 'package:vacabulary_bloc_https/widgets/get_error.dart';
import 'package:vacabulary_bloc_https/widgets/get_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();

    return BlocListener(
      listener: (context, state) {
        if (state is WordSearchedState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ListScreen(words: state.words)));
        }
      },
      bloc: cubit,
      child: Scaffold(
          backgroundColor: Colors.blueGrey[900],
          body: cubit.state is WordSearchingState
              ? const GetLoadingWidget()
              : cubit.state is ErrorState
                  ? const GetErrorWidget(message: "no word found")
                  : cubit.state is NoWordSearchedState
                      ? const GetDictionaryFormWidget()
                      : Container()),
    );
  }
}
