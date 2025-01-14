bool isFormFilled(String text1, String text2, String text3) {
  return text1.isNotEmpty && text2.isNotEmpty && text3.isNotEmpty;
}

double parseDouble(String? text, {double defaultValue = 0}) {
  return double.tryParse(text ?? '') ?? defaultValue;
}

Map<String, double> calculateLostCounter({
  required double rpm,
  required double workHours,
  required double operatorCounter,
}) {
  final double totalCounter = rpm * workHours * 60;
  final double lostCounter = totalCounter - operatorCounter;
  final double percentLost =
      double.parse(((lostCounter / totalCounter) * 100).toStringAsFixed(2));
  final double percentIncome =
      double.parse(((1 - lostCounter / totalCounter) * 100).toStringAsFixed(4));
  final double toMinutes = lostCounter / 60;

  return {
    'countermurni': totalCounter,
    'lostcounter': lostCounter,
    'percentlost': percentLost,
    'percentincome': percentIncome,
    'tominute': toMinutes,
  };
}
