import 'package:json_annotation/json_annotation.dart';

/// This allows the `Club` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'weapon_map.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(fieldRename: FieldRename.snake)
class Weapon {
  Weapon(this.imageUrl, this.key, this.name);

  String imageUrl;
  String key;
  String name;

  /// A necessary factory constructor for creating a new Club instance
  /// from a map. Pass the map to the generated `_$ClubFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Club.
  factory Weapon.fromJson(Map<String, dynamic> json) => _$WeaponFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$ClubToJson`.
  Map<String, dynamic> toJson() => _$WeaponToJson(this);
}