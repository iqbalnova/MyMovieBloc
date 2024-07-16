import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymoviebloc/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String label;
  // final Decoration? decoration;
  final bool isArrowButton;
  final bool isOutlineButton;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.label,
    // this.decoration,
    this.isArrowButton = false,
    this.isOutlineButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        width: double.infinity,
        height: isOutlineButton ? 35.h : 55.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isOutlineButton ? 20 : 6),
          border: isOutlineButton
              ? Border.all(
                  width: 1,
                  color: greyColor,
                )
              : null,
          color: isOutlineButton ? whiteColor : primaryColor,
        ),
        child: isArrowButton
            ? Container(
                padding: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: whiteColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        label,
                        style: whiteTextStyle,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: whiteColor,
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: Text(
                  label,
                  style: whiteTextStyle.copyWith(
                      fontSize: isOutlineButton ? null : 20.sp,
                      fontWeight: FontWeight.w600,
                      color: isOutlineButton ? greyColor : whiteColor),
                ),
              ),
      ),
    );
  }
}
