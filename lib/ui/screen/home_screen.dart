part of 'screens.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: secondaryOneColor,
        drawer: const MyDrawer(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: secondaryOneColor,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            'Modul App',
            style: appTitle.copyWith(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.logout_outlined))
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              HomeMenu(
                title: 'Complete Selular',
                urlAsset: 'assets/complete.jpg',
                onTap: () async => await controller
                    .getDocument(
                        isSingle: true,
                        type: 'general',
                        search: 'complete selular')
                    .then(
                      (value) => value.value!
                          ? Get.to(
                              () => PdfScreen(
                                  title: 'Budaya Perusahaan',
                                  link: baseUrlDocs + controller.modul!.path!,
                                  isQuizable: controller.modul!.isQuizable!),
                            )
                          : snackbar(context, false, value.message!,
                              duration: 1000),
                    ),
              ),
              HomeMenu(
                urlAsset: 'assets/budaya.jpg',
                title: 'Budaya Perusahaan',
                onTap: () async => await controller
                    .getDocument(
                        isSingle: true,
                        type: 'general',
                        search: 'budaya perusahaan')
                    .then((value) => value.value!
                        ? Get.to(
                            () => PdfScreen(
                                title: 'Budaya Perusahaan',
                                link: baseUrlDocs + controller.modul!.path!,
                                isQuizable: controller.modul!.isQuizable!),
                          )
                        : snackbar(context, false, value.message!,
                            duration: 1000)),
              ),
              HomeMenu(
                urlAsset: 'assets/csa.jpg',
                title: 'Pengenalan Program',
                onTap: () async => await controller
                    .getDocument(
                        isSingle: true,
                        type: 'general',
                        search: 'pengenalan program')
                    .then(
                      (value) => value.value!
                          ? Get.to(
                              () => PdfScreen(
                                  title: 'Budaya Perusahaan',
                                  link: baseUrlDocs + controller.modul!.path!,
                                  isQuizable: controller.modul!.isQuizable!),
                            )
                          : snackbar(context, false, value.message!,
                              duration: 1000),
                    ),
              ),
              HomeMenu(
                urlAsset: 'assets/job_desc.jpg',
                title: 'Job Description',
                onTap: () async => await controller
                    .getDocument(isSingle: false, type: 'job-desc')
                    .then(
                      (value) => value.value!
                          ? Get.to(
                              () => const ModulListScreen(
                                title: 'Job Description',
                              ),
                            )
                          : snackbar(context, false, value.message!,
                              duration: 1000),
                    ),
              ),
              HomeMenu(
                urlAsset: 'assets/explain_job.jpg',
                title: 'Penjelasan Pekerjaan',
                onTap: () => Get.to(
                  () => const JobDetailsScreen(),
                  transition: Transition.cupertino,
                ),
              ),
              HomeMenu(
                  urlAsset: 'assets/katalog.jpg', title: 'Katalog', onTap: () {}
                  //  () => Get.to(
                  //   () => const PdfScreen(
                  //       title: 'Katalog',
                  //       link: baseUrlDocs + 'katalog_retail.pdf'),
                  // ),
                  ),
            ],
          ),
        ),
      );
}
