import 'package:softbd/src/config/imports.dart';

class AddNewController extends GetxController{
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  FocusNode focusNode = FocusNode();
  ValueNotifier<String?> selectedItem = ValueNotifier<String?>(null);
}