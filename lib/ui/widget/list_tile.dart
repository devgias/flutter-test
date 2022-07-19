part of 'widgets.dart';

class ListTileMenu extends StatelessWidget {
  final Function()? ontap;
  final String? titleText;
  const ListTileMenu({Key? key, required this.ontap, required this.titleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: ontap,
        leading: Container(
          height: 30,
          width: 40,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/file.png'), fit: BoxFit.fill),
          ),
        ),
        trailing: const Icon((Icons.arrow_circle_right_rounded)),
        title: Text(
          titleText!,
          style: subtTitle,
          overflow: TextOverflow.ellipsis,
        ),
      );
}
