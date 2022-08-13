part of 'screens.dart';

class ModulListScreen extends GetView<HomeController> {
  final String title;
  const ModulListScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, false);
          controller.searchController.clear();
          return Future.value(true);
        },
        child: Scaffold(
          backgroundColor: secondaryOneColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: secondaryOneColor,
            iconTheme: const IconThemeData(color: Colors.white),
            title: Text(
              title,
              style: appTitle.copyWith(color: Colors.white),
            ),
          ),
          body: ListView(
            children: [
              Container(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: controller.searchController,
                    onChanged: (String? value) => controller.search(value),
                    autocorrect: true,
                    decoration: const InputDecoration(
                      hintText: 'Search Modul',
                      prefixIcon: Icon(Icons.search),
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                  )),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: MediaQuery.of(context).size.height - 200,
                child: GetBuilder<HomeController>(
                  id: 'modulList',
                  builder: (_) => (controller.filteredModuls ?? []).isEmpty
                      ? Center(
                          child: Column(
                          children: [
                            Container(
                              height: 300,
                              width: 300,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/no-data.png'),
                                      fit: BoxFit.cover)),
                            ),
                            Text(
                              controller.searchController.text.isEmpty
                                  ? 'Belum ada modul'
                                  : 'Tidak ditemukan modul',
                              style: subtTitle.copyWith(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ))
                      : ListView.builder(
                          itemCount: controller.filteredModuls?.length,
                          itemBuilder: (context, index) => Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            elevation: 10,
                            child: ListTileMenu(
                              ontap: () => Get.to(
                                  () => PdfScreen(
                                        modul: controller.moduls![index],
                                      ),
                                  transition: Transition.cupertino),
                              titleText: controller.filteredModuls![index].name,
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      );
}
