import 'package:json_annotation/json_annotation.dart';

/// This allows the `Club` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'gadget_map.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(fieldRename: FieldRename.snake)
class Gadget {
  Gadget(this.imageUrl, this.name, this.key);

  String imageUrl;
  String name;
  String key;

  /// A necessary factory constructor for creating a new Club instance
  /// from a map. Pass the map to the generated `_$ClubFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Club.
  factory Gadget.fromJson(Map<String, dynamic> json) => _$GadgetFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$ClubToJson`.
  Map<String, dynamic> toJson() => _$GadgetToJson(this);
}