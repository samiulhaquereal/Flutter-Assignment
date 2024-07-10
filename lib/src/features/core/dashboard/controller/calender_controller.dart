import 'dart:developer';

import 'package:softbd/src/config/imports.dart';
import 'package:intl/intl.dart';
import 'package:softbd/src/features/core/dashboard/model/activities_model.dart';


class CalenderController extends GetxController {
  final Services _services = Services();
  final ScrollController scrollController = ScrollController();
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  late DateTime today;
  late List<DateTime> dateRange;
  RxBool isIgnore = false.obs;
  final ActivitiesModel activitiesModel = ActivitiesModel();
  Rx<ActivitiesModel> activitiesModelList = ActivitiesModel().obs ;

  final Map<String, String> banglaDays = {
    'Mon': 'সোম',
    'Tue': 'মঙ্গল',
    'Wed': 'বুধ',
    'Thu': 'বৃহ',
    'Fri': 'শুক্র',
    'Sat': 'শনি',
    'Sun': 'রবি',
  };

  final Map<String, String> banglaDigits = {
    '0': '০',
    '1': '১',
    '2': '২',
    '3': '৩',
    '4': '৪',
    '5': '৫',
    '6': '৬',
    '7': '৭',
    '8': '৮',
    '9': '৯',
  };

  final Map<String, String> banglaMonths = {
    'January': 'জানুয়ারী',
    'February': 'ফেব্রুয়ারী',
    'March': 'মার্চ',
    'April': 'এপ্রিল',
    'May': 'মে',
    'June': 'জুন',
    'July': 'জুলাই',
    'August': 'আগস্ট',
    'September': 'সেপ্টেম্বর',
    'October': 'অক্টোবর',
    'November': 'নভেম্বর',
    'December': 'ডিসেম্বর',
  };

  @override
  void onInit()async{
    super.onInit();
    await getDate();
    await getData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToCurrentDate();
    });
  }

  void scrollToCurrentDate() {
    int todayIndex = dateRange.indexWhere((date) =>
    date.day == today.day &&
        date.month == today.month &&
        date.year == today.year);
    if (todayIndex != -1) {
      double position = todayIndex * (37.0 + 16.0);
      scrollController.animateTo(
        position,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  String getBanglaDayName(DateTime date) {
    String dayInEnglish = DateFormat('E').format(date);
    return banglaDays[dayInEnglish] ?? dayInEnglish;
  }

  String getBanglaDayNumber(DateTime date) {
    String dayNumber = DateFormat('dd').format(date);
    return dayNumber.split('').map((digit) => banglaDigits[digit] ?? digit).join('');
  }

  String getBanglaFullMonthName(DateTime date) {
    String monthInEnglish = DateFormat('MMMM').format(date);
    return banglaMonths[monthInEnglish] ?? monthInEnglish;
  }

  Future<void> getDate()async{
    try {
      today = DateTime.now();
      dateRange = List.generate(15, (index) => today.subtract(Duration(days: 7 - index)));
    }catch (e) {
      log(e.toString());
    }
  }

  Future<void> getData()async{
    try {
      Map<String, dynamic>? data = await _services.getActivitiesData();
      if(data != null && data!.isNotEmpty){
        activitiesModelList.value = ActivitiesModel.fromJson(data);
      } else {
        log('Data is Empty');
      }
    } catch (e) {
      log(e.toString());
    }
  }

}
