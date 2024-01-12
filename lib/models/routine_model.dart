
import 'package:isar/isar.dart';

//dart run build_runner build
part 'routine_model.g.dart';

@Collection()
class Routine{
  Id id = Isar.autoIncrement;
  @ignore
  late List<Classes> data;
}

class Classes{
  late String type;
  late String code;
  late int start;
  late int end;
  late String prof;

  Classes(this.type, this.code, this.start, this.end, this.prof);
}