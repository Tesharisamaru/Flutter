import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vehicle/data/type_extra.dart';
import 'package:vehicle/data/type_tire.dart';
import 'package:vehicle/data/type_vehicle.dart';
import 'package:vehicle/repository/extra_repository.dart';
import 'package:vehicle/repository/tire_repository.dart';
import 'package:vehicle/repository/type_repository.dart';
import 'package:vehicle/repository/type_repository_dummy_impl.dart';
import 'package:vehicle/second_page.dart';
import 'package:vehicle/vehicle_widget.dart';
import 'package:vehicle/tire_widget.dart';
import 'package:vehicle/extra_widget.dart';

class FirstPageWidget extends StatelessWidget {
  const FirstPageWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    final typeRepository = GetIt.instance<TypeRepository>();
    final tireRepository = GetIt.instance<TireRepository>();
    final extraRepository = GetIt.instance<ExtraRepository>();

    final vehicles = typeRepository.vehicles;
    final tires = tireRepository.tires;
    final extras = extraRepository.extras;

    int totalCost = 250;
    String selectedVehicle = "Car";
    int availableCredits = 300;
    int remainingCredits = availableCredits - totalCost;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Tune your vehicle"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Vehicles",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: vehicles.length,
              itemBuilder: (BuildContext context, int index) {
                return VehicleWidget(typeVehicle: vehicles[index]);
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Tires",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tires.length,
              itemBuilder: (BuildContext context, int index) {
                return TireWidget(typeTire: tires[index]);
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Extras",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: extras.length,
              itemBuilder: (BuildContext context, int index) {
                return ExtraWidget(typeExtra: extras[index]);
              },
            ),
          ),
          // ...

// Section pour afficher le total et les crédits disponibles
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total: $totalCost credits',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '$remainingCredits credits remaining',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: double.infinity, // S'étend sur la largeur de l'écran
              child: ElevatedButton(
                onPressed: () {
                  // Naviguer vers l'écran "Purchase Done" avec les détails nécessaires
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PurchaseDoneScreen(
                        totalCost: totalCost,
                        selectedVehicle: selectedVehicle,
                        remainingCredits: remainingCredits,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // couleur violette
                  padding: const EdgeInsets.all(12.0),
                ),
                child: const Text(
                  'Purchase',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // couleur blanche
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}