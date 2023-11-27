import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/stream.dart';

class MyWidget extends ConsumerWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = ref.watch(streamNotifierProvider);

    final widget = stream .when(
      loading: () => Text('ロード中'),
      error: (e,s) => Text('エラーe'),
      data: (d) => Text('$d'),
    );

    final  Streambutton =  ElevatedButton(
      onPressed : () {
        final notifier = ref.read(streamNotifierProvider.notifier);
        notifier.updateState();
      },
      child:Text('受信')
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      // 横に並べる
      widget, Streambutton,
    ]
    );
  }
}
//aaaa