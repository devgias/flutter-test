part of 'widgets.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() ontap;
  const DrawerListTile(
      {Key? key, required this.title, required this.icon, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        onTap: ontap,
        title: Text(
          title,
          style: subtTitle.copyWith(color: Colors.white),
        ),
      );
}
