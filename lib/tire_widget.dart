import 'package:flutter/material.dart';
import 'package:vehicle/data/type_extra.dart';
import 'package:vehicle/data/type_tire.dart';
import '../data/type_vehicle.dart';

class TireWidget extends StatefulWidget {
  final TypeTire typeTire;


  const TireWidget({
    super.key,
    required this.typeTire,

  });

  @override
  _TireWidgetState createState() => _TireWidgetState();
}

class _TireWidgetState extends State<TireWidget> {
  String selectedVehicle = '';
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
                    value: widget.typeTire.value,
                    groupValue: selectedVehicle,
                    onChanged: (value) {
                      setState(() {
                        selectedVehicle = widget.typeTire.value.toString();
                        updateTotalCost();
                      });
                    },
                  ),
                  Expanded(child: Text(widget.typeTire.name)),
                  const SizedBox(width: 64), // Espace horizontal de 16 dp
                  Expanded(child: Text("${widget.typeTire.value} credits")),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void updateTotalCost() {
    selectedVehicle = widget.typeTire.value.toString() ;

    setState(() {
      totalCost = int.parse(selectedVehicle);
    });
  }
}
