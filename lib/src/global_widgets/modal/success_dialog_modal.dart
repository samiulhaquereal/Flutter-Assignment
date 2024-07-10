import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:retcore/src/config/imports.dart';
import 'package:softbd/src/config/imports.dart';

class CustomDialogBox {
  static CustomDialogBox? _instance;

  CustomDialogBox._internal();

  factory CustomDialogBox() {
    _instance ??= CustomDialogBox._internal();
    return _instance!;
  }

  static Future<bool> dialogBox({
    required String title,
    required String content,
    required String buttonTitle,
  }) async {
    BuildContext? context = FindContext.getContext();
    Completer<bool> completer = Completer<bool>();
    showGeneralDialog(
        context: context!,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation1, animation2) {
          return Container();
        },
        transitionBuilder: (context, a1, a2, widget) {
          return ScaleTransition(
            scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: Dialog(
                child: Container(
                  height: 286.h,
                  width: 327.w,
                  decoration:
                      BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                        color: tWhiteColor
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RetCore.space(15),
                      Center(
                        child: Image.asset(
                          checkIcon,
                          width: 96,
                          height: 96,
                        ),
                      ),
                      RetCore.space(15),
                      Text(title,
                          style: GoogleFonts.notoSerifBengali(
                              color: tBlackColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,)),
                      RetCore.space(10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                            content,
                            style: GoogleFonts.notoSerifBengali(
                                color: parseColor('6A6A6A'),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400)),
                      ),
                      RetCore.space(15),
                      CustomButton(
                        onTap: () {
                          RetCore.back();
                        },
                        height: 46.h,
                        width: 207.w,
                        radius: 8.r,
                        label: buttonTitle,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
    return completer.future;
  }
}
