import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';

class HomeCubit extends HydratedCubit<int> {
  HomeCubit() : super(0);
  final String bottomNavigationIndexKey = 'bottomNavigationIndex';

  /// Functions contain async logics should return [Future] type
  Future<void> changeBottomNavigationIndex(int index) async {
    emit(index);
  }

  @override
  int? fromJson(Map<String, dynamic> json) {
    return json[bottomNavigationIndexKey];
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    return {
      bottomNavigationIndexKey: state,
    };
  }
}
