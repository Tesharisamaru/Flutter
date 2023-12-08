import 'package:vehicle/main.dart';
import 'package:vehicle/repository/tire_repository.dart';
import '../data/type_vehicle.dart';
import '../data/type_extra.dart';
import '../data/type_tire.dart';
import 'package:vehicle/repository/type_repository.dart';
import 'package:vehicle/repository/type_repository_dummy_impl.dart';
import 'tire_repository.dart';

class TireRepositoryDummyImpl implements TireRepository {
  @override
  get tires {
    return [
      TypeTire("Hard tires", 0),
      TypeTire("Soft tires", 30),
    ];
  }

}