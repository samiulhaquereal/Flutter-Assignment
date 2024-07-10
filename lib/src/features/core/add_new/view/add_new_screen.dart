import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softbd/src/config/imports.dart';



class AddNewScreen extends StatelessWidget {
  const AddNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<AddNewController>()) {
      Get.lazyPut(() => AddNewController());
    }
    final controller = Get.find<AddNewController>();
    return SafeArea(child: Scaffold(
      backgroundColor: tButtonBackgroundColor,
      appBar: AppBar(
        title: Text('নতুন যোগ করুন',style: GoogleFonts.notoSerifBengali(color: tBlackColor,fontSize: 16.sp,fontWeight: FontWeight.w700)),
        centerTitle: true,
        backgroundColor: tButtonBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('অনুচ্ছেদ',style: GoogleFonts.notoSerifBengali(color: tBlackColor,fontSize: 16.sp,fontWeight: FontWeight.w700)),
                  Text('৪৫ শব্দ',style: GoogleFonts.notoSerifBengali(color: Colors.grey,fontSize: 14.sp,fontWeight: FontWeight.w400)),
                ],
              ),
              RetCore.space(7.h),
              RetCoreTextField(
                controller: controller.controller,
                hint: 'অনুচ্ছেদ লিখুন',
                isBorder: true,
                borderColor: Colors.grey,
                borderRadius: 5.r,
                focusedColor: tPrimaryColor,
                inputFormatters: [
                  WordInputFormatter(maxWords: 45)
                ],
              ),
              RetCore.space(15.h),
              Text('অনুচ্ছেদের বিভাগ',style: GoogleFonts.notoSerifBengali(color: tBlackColor,fontSize: 16.sp,fontWeight: FontWeight.w700)),
              RetCore.space(7.h),
              RetCoreDropdownField(
                itemList: [
                  'বিভাগ ১',
                  'বিভাগ ২',
                  'বিভাগ ৩',
                ],
                hint: 'অনুচ্ছেদের বিভাগ নির্বাচন করুন',
                suffixIcon: Icons.arrow_forward_ios_rounded,
                iconSize: 14.sp,
                iconColor: Colors.grey,
                retCoreDropdownFieldStyle: RetCoreDropdownFieldStyle.normal,
                selectedItem: controller.selectedItem,
                fieldFocusNode: controller.focusNode,
                borderRadius: 5.r,
              ),
              RetCore.space(15.h),
              Text('তারিখ ও সময়',style: GoogleFonts.notoSerifBengali(color: tBlackColor,fontSize: 16.sp,fontWeight: FontWeight.w700)),
              RetCore.space(7.h),
              RetCoreTextField(
                controller: controller.controller,
                hint: 'নির্বাচন করুন',
                isDatePicker: true,
                isBorder: true,
                iconSize: 14.sp,
                iconColor: Colors.grey,
                borderColor: Colors.grey,
                borderRadius: 5.r,
                focusedColor: tPrimaryColor,
              ),
              RetCore.space(15.h),
              Text('স্থান',style: GoogleFonts.notoSerifBengali(color: tBlackColor,fontSize: 16.sp,fontWeight: FontWeight.w700)),
              RetCore.space(7.h),
              RetCoreTextField(
                controller: controller.controller,
                hint: 'নির্বাচন করুন',
                suffixIcon: Icons.arrow_forward_ios_rounded,
                prefixIcon: Icons.location_on,
                iconSize: 14.sp,
                iconColor: Colors.grey,
                isBorder: true,
                borderColor: Colors.grey,
                borderRadius: 5.r,
                focusedColor: tPrimaryColor,
              ),
              RetCore.space(15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('অনুচ্ছেদের বিবরণ',style: GoogleFonts.notoSerifBengali(color: tBlackColor,fontSize: 16.sp,fontWeight: FontWeight.w700)),
                  Text('১২০ শব্দ',style: GoogleFonts.notoSerifBengali(color: Colors.grey,fontSize: 14.sp,fontWeight: FontWeight.w400)),
                ],
              ),
              RetCore.space(7.h),
              RetCoreTextField(
                controller: controller.controller,
                hint: 'কার্যক্রমের বিবরণ লিখুন',
                maxLine: 9,
                iconSize: 14.sp,
                iconColor: Colors.grey,
                isBorder: true,
                borderColor: Colors.grey,
                borderRadius: 5.r,
                focusedColor: tPrimaryColor,
                keyboardType: RetCoreKeyboardType.multiline,
                inputFormatters: [
                  WordInputFormatter(maxWords: 120)
                ],
              ),
              RetCore.space(15.h),
              CustomButton(
                  onTap: ()async{
                await CustomDialogBox.dialogBox(title: 'নতুন অনুচ্ছেদ সংরক্ষন', content: 'আপনার সময়রেখাতে নতুন অনুচ্ছেদ সংরক্ষণ সম্পুর্ন হয়েছে',buttonTitle:'আরও যোগ করুন');
              },
                  height: 46.h,
                  width: RetCore.width(),
                  radius: 10.r,
                  label: 'সংরক্ষন করুন',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp
              )
            ],
          ),
        ),
      ),
    ));
  }
}
