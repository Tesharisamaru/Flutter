import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PurchaseDoneScreen extends StatelessWidget {
  final int totalCost;
  final String selectedVehicle;
  final int remainingCredits;

  const PurchaseDoneScreen({
    Key? key,
    required this.totalCost,
    required this.selectedVehicle,
    required this.remainingCredits,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase Done'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Purchase Summary',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text('Total Cost: $totalCost credits'),
            Text('Selected Vehicle: $selectedVehicle'),
            Text('Remaining Credits: $remainingCredits credits'),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {// Copiez les détails dans le presse-papiers
                String purchaseDetails = """
                Purchase Summary
                Total Cost: $totalCost credits
                Selected Vehicle: $selectedVehicle
                Remaining Credits: $remainingCredits credits
                """;

                writeClipboard(context,purchaseDetails);
              },
              child: const Text('Copy to Clipboard'),
            ),
          ],
        ),
      ),
    );
  }
}
void writeClipboard(BuildContext context, String text) async {
  await Clipboard.setData(ClipboardData(text: text));
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Details copied to clipboard')),
  );
}
