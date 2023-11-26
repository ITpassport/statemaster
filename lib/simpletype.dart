import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'simpletype.g.dart';

@riverpod
class SimpleNotifier extends _$SimpleNotifier {
  @override
  int build() {
    // 最初のデータ
    return 0;
  }
  // データを変更する関数
  void updateState() {
    // 変更前のデータ
    final oldState = state;
    // 変更後のデータ
    final newState = oldState + 1;
    // データを上書き
    state = newState;
  }
}