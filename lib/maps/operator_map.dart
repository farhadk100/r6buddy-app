import 'package:json_annotation/json_annotation.dart';
import 'package:r6buddy/maps/operator_bio_map.dart';
import 'package:r6buddy/maps/operator_loadout_map.dart';
import 'package:r6buddy/utilities/enums.dart';

/// This allows the `Club` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'operator_map.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(fieldRename: FieldRename.snake)
class Operator {
  Operator(this.armor, this.speed, this.bio, this.type, this.loadout, this.name, this.iconUrl, this.portraitUrl, this.key);

  int armor;
  int speed;
  OperatorType type;
  OperatorBio bio;
  OperatorLoadout loadout;
  String name;
  String iconUrl;
  String portraitUrl;
  String key;

  /// A necessary factory constructor for creating a new Club instance
  /// from a map. Pass the map to the generated `_$ClubFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Club.
  factory Operator.fromJson(Map<String, dynamic> json) => _$OperatorFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$ClubToJson`.
  Map<String, dynamic> toJson() => _$OperatorToJson(this);
}