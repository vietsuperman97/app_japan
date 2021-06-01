import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:utils_libs/utils_libs.dart';

class WidgetInput extends StatefulWidget {
  final TextEditingController? inputController;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final String? hint, errorText, initialValue;
  final int? maxLine;
  final int? minLine;
  final double? height;
  final bool? obscureText;
  final TextInputType? inputType;
  final Widget? leadIcon;
  final Widget? endIcon;
  final bool? enabled;
  final FocusNode? focusNode;
  final CrossAxisAlignment? crossAxisAlignment;
  const WidgetInput(
      {Key? key,
      this.focusNode,
      this.inputController,
      this.onChanged,
      this.validator,
      this.hint,
      this.errorText,
      this.initialValue,
      this.maxLine = 1,
      this.minLine = 1,
      this.height = 50,
      this.obscureText = false,
      this.inputType = TextInputType.text,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.leadIcon,
      this.endIcon,
      this.enabled = true})
      : super(key: key);

  @override
  _WidgetInputState createState() => _WidgetInputState();
}

class _WidgetInputState extends State<WidgetInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: COLORS.BLACK),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: widget.crossAxisAlignment!,
        children: [
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                key: widget.key,
                controller: widget.inputController,
                onChanged: (change) => widget.onChanged!(change),
                enabled: widget.enabled,
                validator: widget.validator,
                style: AppStyle.DEFAULT_MEDIUM,
                maxLines: widget.maxLine,
                minLines: widget.minLine,
                keyboardType: widget.inputType,
                textAlign: TextAlign.left,
                obscureText: widget.obscureText!,
                initialValue: widget.initialValue,
                focusNode: widget.focusNode,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: AppStyle.DEFAULT_MEDIUM.copyWith(color: COLORS.GREY_400),
                  errorText: widget.errorText,
                  errorStyle: AppStyle.DEFAULT_VERY_SMALL,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          widget.endIcon != null ? Padding(
            padding: EdgeInsets.only(right: 5),
            child: Center(child: Container(height: 25, width: 25, child: widget.endIcon)),
          ) : Container()
        ],
      ),
    );
  }
}

