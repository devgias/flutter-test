part of 'controllers.dart';

class HomeController extends GetxController {
  ModulModel? modul;
  List<ModulModel>? moduls;
  List<ModulModel>? filteredModuls;
  final TextEditingController searchController = TextEditingController();

  Future<ApiReturnValue<bool>> getDocument(
      {required bool isSingle, required String? type, String? search}) async {
    final result = isSingle
        ? await ModulService.getSingleModuls(type: type, search: search)
        : await ModulService.getMultipleModuls(type: type, search: search);
    if (result.value == null) {
      return ApiReturnValue(value: false, message: result.message);
    }

    if (isSingle) {
      modul = result.value as ModulModel;
    } else {
      moduls = result.value as List<ModulModel>;
      filteredModuls = result.value as List<ModulModel>;
    }
    update(['modulList']);

    return ApiReturnValue(value: true, message: null);
  }

  void search(String? search) {
    if (search == null) {
      filteredModuls = moduls;
    } else {
      filteredModuls = moduls
          ?.where((element) =>
              element.name!.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }
    update(['modulList']);
  }

  @override
  void onInit() async {
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    super.onInit();
  }
}
