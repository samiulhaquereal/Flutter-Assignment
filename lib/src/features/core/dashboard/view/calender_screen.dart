import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softbd/src/config/imports.dart';


class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});


  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CalenderController>()) {
      Get.lazyPut(() => CalenderController());
    }
    final controller = Get.find<CalenderController>();
    DateTime currentDate = DateTime.now();
    return SafeArea(
        child: Scaffold(
      backgroundColor: tButtonBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('আজ, ${controller.getBanglaDayNumber(currentDate)} ${controller.getBanglaFullMonthName(currentDate)}',
                    style: GoogleFonts.notoSerifBengali(
                        color: tBlackColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700)),
                CustomButton(
                  onTap: () {
                    Get.toNamed(RoutesClass.getAddNewRoute());
                  },
                  height: 30.h,
                  width: 100.w,
                  radius: 10.r,
                  label: 'নতুন যোগ করুন',
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp,
                ),
              ],
            ),
            RetCore.space(15.h),
            DateScroller(),
          ],
        ),
      ),
    ));
  }
}

class DateScroller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CalenderController>()) {
      Get.lazyPut(() => CalenderController());
    }
    final controller = Get.find<CalenderController>();
    return Container(
      alignment: Alignment.center,
      height: 100.h,
      width: RetCore.infinity(),
      decoration: BoxDecoration(
        color: tGrayColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            blurRadius: 6.r, // Shadow blur radius
            offset: const Offset(0, 2), // Shadow position
          ),
        ],
      ),
      child: Center(
        child: Obx(() => ListView.builder(
          controller: controller.scrollController,
          scrollDirection: controller.isIgnore.isFalse ? Axis.horizontal : Axis.horizontal,
          itemCount: controller.dateRange.length,
          itemBuilder: (context, index) {
            DateTime currentDate = controller.dateRange[index];
            bool isToday = currentDate.day == controller.today.day &&
                currentDate.month == controller.today.month &&
                currentDate.year == controller.today.year;

            return GestureDetector(
              onTap: () {
                controller.selectedDate.value = currentDate;
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: tButtonBackgroundColor,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: isToday ? tPrimaryColor : Colors.transparent,
                      width: 2.w,
                    ),
                  ),
                  height: 63.0.h,
                  width: 37.0.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(controller.getBanglaDayName(currentDate),
                        style: GoogleFonts.notoSerifBengali(color: parseColor('6A6A6A'), fontSize: 14.0, fontWeight: FontWeight.w400),
                      ),
                      RetCore.space(5.h),
                      Text(
                        controller.getBanglaDayNumber(currentDate),
                        style: GoogleFonts.notoSerifBengali(
                          color: tBlackColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      RetCore.space(5.h),
                    ],
                  ),
                ),
              ),
            );
          },
        )),
      )
    );
  }
}
