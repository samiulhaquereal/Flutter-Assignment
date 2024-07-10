import 'package:softbd/src/config/imports.dart';

class AddNewController extends GetxController{
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  ValueNotifier<String?> selectedItem = ValueNotifier<String?>(null);
}