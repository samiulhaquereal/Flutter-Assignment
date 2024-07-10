import 'package:softbd/src/config/imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<DashboardController>()) {
      Get.lazyPut(() => DashboardController());
    }
    final controller = Get.find<DashboardController>();
    return SafeArea(
        child: Obx(()=> Scaffold(
            appBar: AppBar(
              backgroundColor: tButtonBackgroundColor,
              titleSpacing: controller.myIndex.value != 0 ? 0.w : 5.w,
              title: controller.myIndex.value == 0 ? Row(
                children: [
                  Image.asset(appbarIcon),
                  Gap(10.w),
                  Text('Flutter Task',style: GoogleFonts.notoSerifBengali(color: tBlackColor,fontSize: 16.sp,fontWeight: FontWeight.w700)),
                ],
              ) : Text('সময়রেখা',style: GoogleFonts.notoSerifBengali(color: tBlackColor,fontSize: 16.sp,fontWeight: FontWeight.w700)),
              centerTitle: true,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: InkWell(
                    onTap: (){},
                    child: Badge(
                      smallSize: 8,
                      child: Container(
                        width: 35.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: tButtonBackgroundColor,
                          borderRadius: BorderRadius.circular(20.r)
                        ),
                          child: Icon(Icons.notifications_none,color: tBlackColor,size: 25.sp,)),
                    ),
                  ),
                )
              ],
            ),
            drawer: Drawer(backgroundColor: tWhiteColor),
            body: Stack(
              children: [
                IndexedStack(
                    index: controller.myIndex.value,
                    children: controller.screenList,
                  ),
                Positioned(
                  right: -53.w,
                  left: -48.w,
                  bottom: -47.h,
                  child: SvgPicture.asset(
                    navbarBg,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0.w,
                  left: 0.w,
                  bottom: 45.h,
                  child: Center(
                    child: Container(
                      height: 56.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        gradient: LinearGradient(
                          colors: [
                            tPrimaryColor,
                            tPrimaryColor2,
                          ]
                        )
                      ),
                      child: Image.asset(ButtonIcon7),
                    ),
                  ),
                ),

                Positioned(
                  bottom: -15.h,
                  child: SizedBox(
                    width: Get.width,
                    height: 100.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: (){
                            controller.myIndex.value = 0;
                            HapticFeedback.lightImpact();
                        }, icon: Icon(Icons.home_filled,color: controller.myIndex.value == 0 ? tBlackColor : Colors.grey,)),
                        IconButton(onPressed: (){
                          controller.myIndex.value = 1;
                          HapticFeedback.lightImpact();
                        }, icon: Icon(Icons.energy_savings_leaf,color: controller.myIndex.value == 1 ? tBlackColor : Colors.grey,)),
                        SizedBox(width: Get.width * 0.20),
                        IconButton(onPressed: (){
                          controller.myIndex.value = 2;
                          HapticFeedback.lightImpact();
                        }, icon: Icon(Icons.energy_savings_leaf,color: controller.myIndex.value == 2 ? tBlackColor : Colors.grey,)),
                        IconButton(onPressed: (){
                          controller.myIndex.value = 3;
                          HapticFeedback.lightImpact();
                        }, icon: Icon(Icons.energy_savings_leaf,color: controller.myIndex.value == 3 ? tBlackColor : Colors.grey,)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
              ),
        ));
  }
}
