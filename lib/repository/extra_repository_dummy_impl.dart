import 'package:vehicle/main.dart';
import '../data/type_vehicle.dart';
import '../data/type_extra.dart';
import '../data/type_tire.dart';
import 'package:vehicle/repository/type_repository.dart';
import 'package:vehicle/repository/type_repository_dummy_impl.dart';

import 'extra_repository.dart';

class ExtraRepositoryDummyImpl implements ExtraRepository {
  @override
  get extras {
    return [
      TypeExtra("Nitro(10units)", 100),
      TypeExtra("Spoiler", 200),
    ];
  }

}