// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:flutter_mordal_test/core/router/router.dart';
import 'package:flutter_mordal_test/core/services/storage/storage_impl.dart';
import 'package:flutter_mordal_test/core/type/diary.dart';

class EditModal extends ConsumerStatefulWidget {
  const EditModal({super.key, required this.diary});

  final Diary diary;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditModalState();
}

class _EditModalState extends ConsumerState<EditModal> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.diary.title;
    _contentController.text = widget.diary.content;
  }

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
          Text('Edit Screen'),
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
                  id: widget.diary.id,
                  title: _titleController.text,
                  content: _contentController.text,
                  createdAt: widget.diary.createdAt,
                );

                await ref.read(storageProvider).updateData(diary.id, diary);

                _titleController.clear();
                _contentController.clear();

                if (context.mounted) {
                  context.pop(true);
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
