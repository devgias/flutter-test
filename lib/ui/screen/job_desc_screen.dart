part of 'screens.dart';

class JobDescScreen extends GetView<HomeController> {
  const JobDescScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: WillPopScope(
          onWillPop: () async {
            Navigator.pop(context, false);
            controller.searchController.clear();
            return Future.value(true);
          },
          child: Scaffold(
            backgroundColor: secondaryOneColor,
            appBar: AppBar(
              backgroundColor: secondaryOneColor,
              title: Text(
                'Job Description',
                style: title.copyWith(color: Colors.white),
              ),
              bottom: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white.withOpacity(0.4),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: const [
                  Tab(
                    text: 'Explanation',
                  ),
                  Tab(
                    text: 'Moduls',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                PdfScreen(modul: controller.modul ?? const ModulModel()),
                const ModulListWidget(),
              ],
            ),
          ),
        ),
      );
}
