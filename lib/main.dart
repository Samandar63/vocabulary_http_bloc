import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vacabulary_bloc_https/cubit/dictionary_cubit.dart';
import 'package:vacabulary_bloc_https/repository/word_repository.dart';
import 'package:vacabulary_bloc_https/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vacubulary',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => DictionaryCubit(WordRepository()),
        child: const HomeScreen(),
      ),
    );
  }
}
