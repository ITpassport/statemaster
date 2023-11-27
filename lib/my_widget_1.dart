import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/simpletype.dart';


class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final simpletype = ref.watch(simpleNotifierProvider);

    ref.listen(
      simpleNotifierProvider,
        (oldState,newState) {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$oldState から $newState に変更されました'),
          )
        );
        }
    );

    final button = ElevatedButton(
        onPressed: () {
          final notifier = ref.watch(simpleNotifierProvider.notifier);
          //notifierを取得
          notifier.updateState();
        },
        child: const Text('ボタン'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ));

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text('$simpletype'),
        button,
    ]
    );// ボタンを追加
  }
}