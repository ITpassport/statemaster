import 'package:flutter/material.dart';
import 'package:practice/future.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(futureNotifierProvider);

    final futureText = future.when(
      loading: () => Text('ロード中'),
        error: (e,s) => Text('エラー起きてる $e'),
        data:  (d) => Text('$d')
    );

    final futurebutton = ElevatedButton(
    onPressed: (){
      final notifier = ref.watch(futureNotifierProvider.notifier);
      notifier.updateState();
    },
    child:const Text('ボタン')
    );

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        futureText,
        futurebutton,
    ]);
  }
}