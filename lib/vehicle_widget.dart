import 'package:flutter/material.dart';
import 'package:vehicle/data/type_extra.dart';
import 'package:vehicle/data/type_tire.dart';
import '../data/type_vehicle.dart';

class VehicleWidget extends StatefulWidget {
  final TypeVehicle typeVehicle;

  const VehicleWidget({
    Key? key,
    required this.typeVehicle,
  }) : super(key: key);

  @override
  _VehicleWidgetState createState() => _VehicleWidgetState();
}

class _VehicleWidgetState extends State<VehicleWidget> {
  String selectedVehicle = 'Car';
  int totalCost = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 16), // Espace horizontal de 16 dp
                  Radio(
                    value: widget.typeVehicle.value,
                    groupValue: selectedVehicle,
                    onChanged: (value) {
                      setState(() {
                        selectedVehicle = widget.typeVehicle.value.toString();
                        updateTotalCost();
                      });
                    },
                  ),
                  Expanded(child: Text(widget.typeVehicle.name)),
                  const SizedBox(width: 64), // Espace horizontal de 16 dp
                  Expanded(child: Text("${widget.typeVehicle.value} credits")),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void updateTotalCost() {
    selectedVehicle = widget.typeVehicle.value.toString() ;

    setState(() {
      totalCost = int.parse(selectedVehicle);
    });
  }
}
