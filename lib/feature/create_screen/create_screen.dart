// Flutter imports:
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mordal_test/feature/create_modal/create_modal.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_mordal_test/core/router/router.dart';
import 'package:flutter_mordal_test/core/services/storage/storage_impl.dart';
import 'package:flutter_mordal_test/core/type/diary.dart';

class CreateScreen extends ConsumerStatefulWidget {
  const CreateScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateScreenState();
}

class _CreateScreenState extends ConsumerState<CreateScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Create Screen'),
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _contentController,
            decoration: const InputDecoration(labelText: 'Content'),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                final diary = Diary(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: _titleController.text,
                  content: _contentController.text,
                  createdAt: DateTime.now(),
                );

                bool isOk = false;
                if (context.mounted) {
                  isOk = await CreateModalRouteData(diary: diary).push(context);
                }

                if (isOk) {
                  await ref.read(storageProvider).saveData(diary);

                  _titleController.clear();
                  _contentController.clear();
                } else {
                  throw Exception('Failed to create diary');
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error saving data: $e')),
                  );
                }
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
