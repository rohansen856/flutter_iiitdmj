
import 'package:isar/isar.dart';

//dart run build_runner build
part 'settings_model.g.dart';

@Collection()
class Settings{
  Id id = Isar.autoIncrement;
  
}
