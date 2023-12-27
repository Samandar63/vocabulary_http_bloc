part of 'dictionary_cubit.dart';

@immutable
class DictionaryState {}

class NoWordSearchedState extends DictionaryState {}

class WordSearchingState extends DictionaryState {}

class WordSearchedState extends DictionaryState {
  final List<Word> words;

  WordSearchedState(this.words);
}

class ErrorState extends DictionaryState {
  // ignore: prefer_typing_uninitialized_variables
  final message;

  ErrorState(this.message);
}
