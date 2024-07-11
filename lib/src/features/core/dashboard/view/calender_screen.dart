import 'dart:developer';

import 'package:flutter/cupertino.dart';
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
      body: SingleChildScrollView(
        child: Padding(
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
              RetCore.space(25.h),
              Container(
                width: RetCore.width(),
                padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('আজকের কার্যক্রম',
                        style: GoogleFonts.notoSerifBengali(
                            color: tBlackColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700)),
                    RetCore.space(25.h),
                    Obx((){
                      var data = controller.activitiesList.value['data'];
                      if (data == null || (data is List && data.isEmpty)) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (_,index){
                            var item = data[index];
                            return Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
                              child: Row(
                                children: [
                                  Text('${controller.sortDateTimeBangla(item['date'])['period']}\n${controller.sortDateTimeBangla(item['date'])['time'] }',
                                      style: GoogleFonts.notoSerifBengali(
                                          color: tBlackColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500)),
                                  Gap(10.w),
                                  Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          tPrimaryColor,
                                          tPrimaryColor2
                                        ]
                                      ),
                                      borderRadius: BorderRadius.circular(9.r)
                                    ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(LineAwesomeIcons.clock,size: 14.sp,color: tWhiteColor),
                                                Gap(5.w),
                                                Text(controller.sortDateTimeBangla(item['date'])['time'],
                                                    style: GoogleFonts.notoSerifBengali(
                                                        color: tWhiteColor,
                                                        fontSize: 12.sp,
                                                        fontWeight: FontWeight.w500))
                                              ],
                                            ),
                                            Gap(5.h),
                                            Text(item['name'],
                                                style: GoogleFonts.notoSerifBengali(
                                                    color: tWhiteColor,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600)),
                                            Gap(10.h),
                                            Text(item['category'],
                                                style: GoogleFonts.notoSerifBengali(
                                                    color: tWhiteColor,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500)),
                                            Gap(5.h),
                                            Row(
                                              children: [
                                                Icon(LineAwesomeIcons.map_marker_alt_solid,size: 14.sp,color: tWhiteColor),
                                                Gap(5.w),
                                                Text(item['location'],
                                                    style: GoogleFonts.notoSerifBengali(
                                                        color: tWhiteColor,
                                                        fontSize: 12.sp,
                                                        fontWeight: FontWeight.w500)),
                                              ],
                                            ),
                                          ],
                                        ),
                                  )
                                  )
                                ],
                              ),
                            );
                          });
                    }),
                  ],
                ),
              ),
              RetCore.space(100.h),
            ],
          ),
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
