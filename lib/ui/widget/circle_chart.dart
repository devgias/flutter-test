part of 'widgets.dart';

class PieCharResult extends StatelessWidget {
  final double correct, wrong;
  const PieCharResult({Key? key, required this.correct, required this.wrong})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: MediaQuery.of(context).size.height / 3.6,
      child: PieChart(
        PieChartData(
          borderData: FlBorderData(
            border: Border.all(width: 2, color: Colors.black),
            show: true,
          ),
          centerSpaceRadius: 90,
          sectionsSpace: 9,
          sections: [
            _pieData(
                correct, "Betul : ${correct.toInt()}", Colors.green[500]!, 14),
            _pieData(wrong, "Salah : ${wrong.toInt()}", Colors.red[400]!, 12),
          ],
        ),
      ),
    );
  }

  _pieData(
    double value,
    String title,
    Color color,
    double fontSize,
  ) {
    return PieChartSectionData(
        value: value,
        title: title,
        borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
        titlePositionPercentageOffset: -0.8,
        color: color,
        titleStyle: subtTitle.copyWith(
            fontSize: fontSize,
            color: Colors.grey[700],
            fontWeight: FontWeight.bold));
  }
}
