import 'package:get/get.dart';

import 'package:psico_app/app/core/helpers/loader.dart';
import 'package:psico_app/app/data/models/crisis_plan.dart';
import 'package:psico_app/app/data/providers/crisis_plan.dart';

class HelpController extends GetxController {
  RxList<CrisisPlanModel> list         = <CrisisPlanModel>[].obs;
  RxList<CrisisPlanModel> listFiltered = <CrisisPlanModel>[].obs;
  CrisisPlanProvider provider = CrisisPlanProvider();

  @override
  void onInit() async {
    super.onInit();
  }

  void onClose() {
    super.onClose();
  }

  Future<void> refreshData() async {
    LoaderHelper.show();

    listFiltered.clear();
    list.clear();
    list.value         = await provider.loadCrisisPlan();
    listFiltered.value = list.value;
    listFiltered.refresh();

    LoaderHelper.dismiss();
  }

  Future<void> filterList(String value) async {
    listFiltered.value = list.where((item) => item.situation.toLowerCase()
        .contains(value.toLowerCase())).toList();
  }
}