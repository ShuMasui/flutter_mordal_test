// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:flutter_mordal_test/core/services/storage/storage_impl.dart';
import 'package:flutter_mordal_test/core/router/router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Home Screen'),
          Expanded(
            child: StreamBuilder(
              stream: ref.watch(storageProvider).watchAllData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data!;

                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (_, idx) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: ListTile(
                          leading: Text(data[idx].id),
                          title: Text(data[idx].title),
                          subtitle: Text(data[idx].content),
                          trailing: Text(data[idx].createdAt.toString()),
                          onTap: () {
                            EditModalRouteData(diary: data[idx]).push(context);
                          },
                        ),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
