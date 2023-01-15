import 'package:equatable/equatable.dart';

class SmartItemModel extends Equatable {
  final String name;
  final int activeCount;
  final String iconPath;

  const SmartItemModel(
      {required this.name, required this.activeCount, required this.iconPath});

  @override
  List<Object?> get props => [name, activeCount, iconPath];
}
