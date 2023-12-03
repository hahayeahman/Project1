import 'package:flutter/material.dart';
class CurrencyConverter extends StatelessWidget {
  final double amountInDollars;

  const CurrencyConverter({super.key, required this.amountInDollars});


  static const double usdToEuroRate = 0.85;
  static const double usdToQarRate = 3.64;
  static const double usdToGbpRate = 0.75; // British Pounds
  static const double usdToAudRate = 1.35; // Australian Dollars
  static const double usdToCnyRate = 6.38; // Chinese Yuan

  // Method to convert dollars to various currencies
  Map<String, double> convertCurrency() {
    double amountInEuro = amountInDollars * usdToEuroRate;
    double amountInQar = amountInDollars * usdToQarRate;
    double amountInGbp = amountInDollars * usdToGbpRate;
    double amountInAud = amountInDollars * usdToAudRate;
    double amountInCny = amountInDollars * usdToCnyRate;

    return {
      'euro': amountInEuro,
      'qatariRiyal': amountInQar,
      'britishPound': amountInGbp,
      'australianDollar': amountInAud,
      'chineseYuan': amountInCny,
    };
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> convertedAmounts = convertCurrency();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Amount in Dollars: \$${amountInDollars.toString()}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Converted Amounts:',
              style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            buildResultText('Euro', '€', convertedAmounts['euro']),
            buildResultText('Qatari Riyal', '﷼', convertedAmounts['qatariRiyal']),
            buildResultText('British Pound', '£', convertedAmounts['britishPound']),
            buildResultText('Australian Dollar', '\$', convertedAmounts['australianDollar']),
            buildResultText('Chinese Yuan', '¥', convertedAmounts['chineseYuan']),
          ],
        ),
      ),
    );
  }

  Widget buildResultText(String currencyName, String symbol, double? amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$currencyName:',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(width: 10),
          Text(
            '$symbol${amount?.toStringAsFixed(2) ?? 'N/A'}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}