import 'package:hive_ce/hive.dart';

import '../models/task_model.dart';

@GenerateAdapters([AdapterSpec<TaskModel>()])
part 'hive_adapter.g.dart';