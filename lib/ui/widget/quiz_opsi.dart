part of 'widgets.dart';

class QuizOpsi extends StatelessWidget {
  final String opsi;
  final Function()? ontap;
  const QuizOpsi({Key? key, required this.opsi, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: ListTile(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          tileColor: const Color.fromARGB(255, 34, 111, 123),
          onTap: ontap,
          title: Text(
            opsi,
            textAlign: TextAlign.center,
            style: subtTitle.copyWith(fontSize: 20, color: Colors.white70),
          ),
        ),
      );
}
