part of 'widgets.dart';

class QuizOpsi extends StatelessWidget {
  final String opsi;
  final Function()? ontap;
  const QuizOpsi({Key? key, required this.opsi, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: ListTile(
          onTap: ontap,
          title: Text(
            opsi,
            textAlign: TextAlign.center,
            style: subtTitle.copyWith(fontSize: 20),
          ),
        ),
      );
}
