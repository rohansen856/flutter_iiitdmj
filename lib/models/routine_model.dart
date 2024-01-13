
import 'package:isar/isar.dart';

//dart run build_runner build
part 'routine_model.g.dart';

@Collection()
class Routine{
  late Id day;
  late String type;
  late String code;
  late String prof;
  late int from;
  late int to;
  late int sem;
}