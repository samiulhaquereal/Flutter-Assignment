import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softbd/src/config/imports.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: tButtonBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('আজ, ১২ জুলাই ',style: GoogleFonts.notoSerifBengali(color: tBlackColor,fontSize: 16.sp, fontWeight: FontWeight.w700)),
                InkWell(
                    onTap: (){
                      Get.toNamed(RoutesClass.getAddNewRoute());
                    },
                    child: Container(
                      height: 30.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            tPrimaryColor,
                            tPrimaryColor2
                          ]
                        ),
                        borderRadius: BorderRadius.circular(10.r)
                      ),
                      child: Center(child: Text('নতুন যোগ করুন',style: GoogleFonts.notoSerifBengali(color: tWhiteColor,fontSize: 12.sp, fontWeight: FontWeight.w700))),
                    )),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
