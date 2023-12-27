import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vacabulary_bloc_https/cubit/dictionary_cubit.dart';

class GetDictionaryFormWidget extends StatelessWidget {
  const GetDictionaryFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Spacer(),
          const Text(
            "Dictionary app",
            style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontSize: 34,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            "Search any word you want quickly",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(
            height: 32,
          ),
          TextField(
            controller: cubit.queryController,
            decoration: InputDecoration(
                hintText: "Search a word",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.transparent)),
                fillColor: Colors.grey[100],
                filled: true,
                prefixIcon: const Icon(Icons.search),
                hintStyle: const TextStyle(color: Colors.white)),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                cubit.getWordSearched();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  padding: const EdgeInsets.all(16)),
              child: const Text("SEARCH"),
            ),
          )
        ],
      ),
    );
  }
}
