

  import 'package:dictionary/src/core/util/colors.dart';
import 'package:dictionary/src/share/font_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaaTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function()? onTap;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Function? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final TextInputFormatter? formatter;
  final bool? isEnabled;
  final int? maxLength;
  const WaaTextField({
    Key? key,
    this.prefixIcon,
    this.maxLength,
    this.onTap,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.obscureText,
    this.onChanged,
    this.formatter,
    this.validator,
    this.textEditingController,
    this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.0.h),
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Material(
            elevation: 0,
            shadowColor: Colors.black.withOpacity(0.4),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.always,
              maxLengthEnforcement: MaxLengthEnforcement.none,
              enabled: isEnabled,
              onTap: onTap,
              // maxLength: maxLength,
              controller: textEditingController!,
              cursorColor: CustomColors.primaryColor,
              cursorWidth: 0.7,
              keyboardType: keyboardType,
              obscureText: obscureText ?? false,
              onChanged: (text) {
                if (onChanged != null) onChanged!(text);
              },
              validator: validator,
              inputFormatters: [
                formatter ?? FilteringTextInputFormatter.singleLineFormatter
              ],
              style: kFontStyle(context),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.withOpacity(0.2),
                  hintText: hintText,
                  contentPadding: const EdgeInsets.only(
                    left: 15.0,
                    top: 19.0,
                  ),
                  // prefixIcon: Padding(
                  //     padding: const EdgeInsets.all(13.0), child: prefixIcon),
                  suffixIcon: suffixIcon,
                   prefixIcon: prefixIcon,
                  disabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: CustomColors.primaryColor, width: 0.8),
                      borderRadius:
                           BorderRadius.all(Radius.circular(10.0))),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.8),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide( width: 0.8),
                      borderRadius:
                           BorderRadius.all(Radius.circular(10.0))),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.2), width: 0.8),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)))),
            ),
          ),
        )
      ],
    );
  }
}
