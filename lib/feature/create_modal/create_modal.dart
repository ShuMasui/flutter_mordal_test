// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:flutter_mordal_test/core/type/diary.dart';

class Createmodal extends StatelessWidget {
  const Createmodal({super.key, required this.diary});

  final Diary diary;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Diary Created!'),
          Text('Title: ${diary.title}'),
          Text('Content: ${diary.content}'),
          ElevatedButton(
            onPressed: () => context.pop(true),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
