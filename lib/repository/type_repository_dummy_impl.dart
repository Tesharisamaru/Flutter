import 'package:vehicle/main.dart';
import '../data/type_vehicle.dart';
import '../data/type_extra.dart';
import '../data/type_tire.dart';
import 'package:vehicle/repository/type_repository.dart';
import 'package:vehicle/repository/type_repository_dummy_impl.dart';

class TypeRepositoryDummyImpl implements TypeRepository {
  @override
  get vehicles {
    return [
      TypeVehicle("Car", 0),
      TypeVehicle("Motorbike", 0),
      TypeVehicle("Hovercraft", 50),
    ];
  }

}