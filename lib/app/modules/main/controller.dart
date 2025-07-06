import 'package:get/get.dart';

import 'package:psico_app/app/core/helpers/loader.dart';
import 'package:psico_app/app/data/models/message.dart';
import 'package:psico_app/app/data/providers/message.dart';
import 'package:psico_app/app/modules/contacts/page.dart';
import 'package:psico_app/app/modules/emotions/page.dart';
import 'package:psico_app/app/modules/help/page.dart';
import 'package:psico_app/app/modules/questionnaire/page.dart';
import 'package:psico_app/app/modules/tasks/page.dart';

class MainController extends GetxController {
  MessageProvider provider    = MessageProvider();
  RxList<MessageModel> messages = <MessageModel>[].obs;

  @override
  void onInit() async {
    messages.value = await provider.loadMessages();
    super.onInit();
  }

  void onClose() {
    super.onClose();
  }

  Future<void> refreshData() async {
    LoaderHelper.show();
    messages.value = await provider.loadMessages();
    messages.refresh();
    LoaderHelper.dismiss();
  }

  void goToPage(String page) {
    switch (page) {
      case 'help':
        Get.to(() => HelpPage());
        break;
      case 'questionnaire':
        Get.to(() => QuestionnairePage());
        break;
      case 'tasks':
        Get.to(() => TasksPage());
        break;
      case 'contacts':
        Get.to(() => ContactsPage());
        break;
      case 'emotions':
        Get.to(() => EmotionsPage());
        break;
    }
  }
}