import 'package:softbd/src/config/imports.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.onTap,
    required this.height,
    required this.width,
    required this.radius,
    required this.label,
    required this.fontWeight,
    required this.fontSize,
  });

  VoidCallback onTap;
  double height;
  double width;
  double radius;
  double fontSize;
  FontWeight fontWeight;
  String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [tPrimaryColor, tPrimaryColor2]),
              borderRadius: BorderRadius.circular(radius)),
          child: Center(
              child: Text(label,
                  style: GoogleFonts.notoSerifBengali(
                      color: tWhiteColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight))),
        ));
  }
}