import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:vacabulary_bloc_https/model/word.dart';
import 'package:vacabulary_bloc_https/repository/word_repository.dart';
part 'dictionary_state.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final WordRepository _repository;
  DictionaryCubit(this._repository) : super(NoWordSearchedState());

  TextEditingController queryController = TextEditingController();

  Future getWordSearched() async {
    emit(WordSearchingState());

    try {
      final words =
          await _repository.getWordsFromDictionary(queryController.text);

      if (words == null) {
        emit(ErrorState("no word found"));
      } else {
        emit(WordSearchedState(words));
        emit(NoWordSearchedState());
      }
    } on Exception catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
