import 'package:flutter/material.dart';
import 'package:vacabulary_bloc_https/model/word.dart';
import 'package:vacabulary_bloc_https/screens/detail_screen.dart';

class ListScreen extends StatelessWidget {
  final List<Word> words;
  const ListScreen({super.key, required this.words});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.keyboard_backspace,
                color: Colors.white,
              )),
          backgroundColor: Colors.deepOrangeAccent),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      title: Text(
                        "(${index + 1}) "
                        "${words[index].word}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                    word: words[index],
                                  ))),
                    ),
                separatorBuilder: (context, index) => const Divider(
                      color: Colors.grey,
                    ),
                itemCount: words.length),
          ),
        ],
      ),
    );
  }
}
