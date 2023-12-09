import 'package:flutter/material.dart';
import 'package:vehicle/data/type_extra.dart';
import 'package:vehicle/data/type_tire.dart';
import '../data/type_vehicle.dart';

class ExtraWidget extends StatefulWidget {
  final TypeExtra typeExtra;

  const ExtraWidget({
    Key? key,
    required this.typeExtra,
  }) : super(key: key);

  @override
  _ExtraWidgetState createState() => _ExtraWidgetState();
}

class _ExtraWidgetState extends State<ExtraWidget> {
  bool isSelected = false;
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
                  Checkbox(
                    value: isSelected,
                    onChanged: (value) {
                      setState(() {
                        isSelected = value!;
                      });
                    },
                  ),
                  Expanded(child: Text(widget.typeExtra.name)),
                  const SizedBox(width: 64), // Espace horizontal de 64 dp
                  Expanded(child: Text("${widget.typeExtra.value} credits")),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
