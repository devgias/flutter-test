part of 'models.dart';

class ModulModel extends Equatable {
  final int? id;
  final String? name;
  final String? path;
  final bool? isQuizable;

  const ModulModel({
    this.id,
    this.name,
    this.path,
    this.isQuizable,
  });

  ModulModel copyWith({
    int? id,
    String? name,
    String? path,
    bool? isQuizable,
  }) {
    return ModulModel(
      id: id ?? this.id,
      name: name ?? this.name,
      path: path ?? this.path,
      isQuizable: isQuizable ?? this.isQuizable,
    );
  }

  factory ModulModel.fromJson(Map<String, dynamic> json) => ModulModel(
        id: json['id'] as int,
        name: json['name'] as String,
        path: json['path'] as String,
        isQuizable: json['is_quizable'] as bool,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'path': path,
        'is_quizable': isQuizable,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        path,
        isQuizable,
      ];
}
