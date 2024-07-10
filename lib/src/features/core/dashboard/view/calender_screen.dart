import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softbd/src/config/imports.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                Text('আজ, ১২ জুলাই ',
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
            )
          ],
        ),
      ),
    ));
  }
}
