import 'package:flutter/material.dart';
import 'package:vacabulary_bloc_https/model/word.dart';

class DetailScreen extends StatelessWidget {
  final Word word;
  const DetailScreen({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.keyboard_backspace,
              color: Colors.white,
            )),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      backgroundColor: Colors.blueGrey[900],
      body: Container(
        padding: const EdgeInsets.all(32),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  word.word!,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 36,
                  ),
                ),
                Container(),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      final meaning = word.meanings![index];
                      final defanations = meaning.definitions;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meaning.partOfSpeech!,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ListView.separated(
                            itemBuilder: (context, index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                defanations[index].definition != null
                                    ? Text(
                                        "Defination : ${defanations[index].definition}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      )
                                    : Text(""),
                                const SizedBox(
                                  height: 4,
                                ),
                                defanations[index].example != null
                                    ? Text(
                                        "Sentence : ${defanations[index].example}",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14))
                                    : Text(""),
                              ],
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 8,
                            ),
                            itemCount: defanations!.length < 4
                                ? defanations!.length
                                : 3,
                            shrinkWrap: true,
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 32,
                        ),
                    itemCount: word.meanings!.length))
          ],
        ),
      ),
    );
  }
}
