import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softbd/src/config/imports.dart';
import 'package:softbd/src/utils/circular_progressbar/circular_progress_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: tWhiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
        child: Column(
          children: [
            ProfileCard(),
            Gap(25.h),
            TimeCard(),

          ],
        ),
      ),
    ));
  }
}



class RemainTimeBox extends StatelessWidget {
  const RemainTimeBox({
    super.key,
    required this.firstNumber,
    required this.SecondNumber,
    required this.label,
  });

  final String firstNumber;
  final String SecondNumber;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CountDownBox(number: firstNumber),
            Gap(4.w),
            CountDownBox(number: SecondNumber),
          ],
        ),
        Gap(7.h),
        Text(label,style: GoogleFonts.notoSerifBengali(color: tBlackColor,fontSize: 12.sp, fontWeight: FontWeight.w500))
      ],
    );
  }
}

class CountDownBox extends StatelessWidget {
  const CountDownBox({
    super.key,
    required this.number,
  });

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
    width: 24.w,
        height: 24.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: tRed,width: 1.w),
      ),
      child: Center(child: Text(number,style: GoogleFonts.notoSerifBengali(color: tBlackColor,fontSize: 12.sp, fontWeight: FontWeight.w500))),
    );
  }
}

class TimeCard extends StatelessWidget {
  const TimeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 108.w,
              child: AnimatedCircularProgressIndicator(percentage: 0.12, label: 'সময় অতিবাহিত', title: '৬ মাস ৬ দিন',)),
          Gap(15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('মেয়াদকাল',style: GoogleFonts.notoSerifBengali(color: tBlackColor,fontSize: 16.sp, fontWeight: FontWeight.w700)),
                Gap(4.w),
                Row(
                  children: [
                    Icon(Icons.calendar_month,size:14.sp,),
                    Gap(3.w),
                    Expanded(child: Text('১ই জানুয়ারি ২০২৪ - ৩১ই জানুয়ারি ২০৩০',style: GoogleFonts.notoSerifBengali(color: tBlackColor,fontSize: 12.sp, fontWeight: FontWeight.w500))),
                  ],
                ),
                Gap(10.w),
                Text('আরও বাকি',style: GoogleFonts.notoSerifBengali(color: tRed,fontSize: 16.sp, fontWeight: FontWeight.w700)),
                Gap(5.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RemainTimeBox(firstNumber: '০', SecondNumber: '৫', label: 'বছর',),
                    RemainTimeBox(firstNumber: '০', SecondNumber: '৬', label: 'মাস',),
                    RemainTimeBox(firstNumber: '১', SecondNumber: '২', label: 'দিন',),
                  ],
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: tWhiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            blurRadius: 6.0, // Shadow blur radius
            offset: Offset(0, 2), // Shadow position
          ),
        ],
      ),
      padding: EdgeInsets.all(15),
     child: Row(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         ClipRRect(
             borderRadius: BorderRadius.circular(30.r),
             child: Image.asset(profileIcon,height: 60.h,)),
         Gap(10.w),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Text('মোঃ মোহাইমেনুল রেজা',style: TextStyle(fontSize: 20.sp,color: tBlackColor,fontWeight: FontWeight.w700)),
             Gap(3.w),
             Text('সফটবিডি লিমিটেড',style: TextStyle(fontSize: 14.sp,color: tBlackColor,fontWeight: FontWeight.w400)),
             Row(
               children: [
                 Icon(CupertinoIcons.location_solid,size: 16),
                 Gap(3.w),
                 Text('ঢাকা',style: TextStyle(fontSize: 14.sp,color: tBlackColor,fontWeight: FontWeight.w400)),
               ],
             )
           ],
         )
       ],
     ),
    );
  }
}