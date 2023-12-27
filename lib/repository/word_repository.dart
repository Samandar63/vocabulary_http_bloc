import 'dart:io';
import 'package:vacabulary_bloc_https/model/word.dart';
import 'package:vacabulary_bloc_https/services/http_service.dart';

class WordRepository {
  Future<List<Word>?> getWordsFromDictionary(String query) async {
    try {
      final resoponse = await HttpService.getRequest(query);

      if (resoponse.statusCode == 200) {
        final result = wordFromJson(resoponse.body);
        return result;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    }
  }
}
