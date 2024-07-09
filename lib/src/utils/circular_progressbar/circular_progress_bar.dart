import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softbd/src/config/imports.dart';
import 'dart:math' as math;

class AnimatedCircularProgressIndicator extends StatelessWidget {
  const AnimatedCircularProgressIndicator({
    Key? key,
    required this.percentage,
    required this.label,
    required this.title,
  }) : super(key: key);

  final double percentage;
  final String label;
  final String title;

  @override
  Widget build(BuildContext context) {
    RxBool isIgnore = false.obs;
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: percentage),
            duration: Duration(seconds: 1),
            builder: (context, double value, child) => Stack(
              fit: StackFit.expand,
              children: [
                Transform.rotate(
                  angle: 267,
                  child: CircularProgressIndicator(
                    strokeWidth: 10.w,
                    value: value,
                    color: tPrimaryColor,
                    backgroundColor: Colors.grey,
                  ),
                ),
                Center(
                  child: Obx(()=> Text(
                      title,
                      style: GoogleFonts.notoSerifBengali(color: isIgnore.isFalse ? tBlackColor:tBlackColor,fontSize: 14.sp , fontWeight: FontWeight.w600)
                  )),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h / 2),
        Obx(()=> Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.notoSerifBengali(color: isIgnore.isFalse ? tBlackColor : tBlackColor,fontSize: 16.sp, fontWeight: FontWeight.w700)
        ),
        ),
      ],
    );
  }
}