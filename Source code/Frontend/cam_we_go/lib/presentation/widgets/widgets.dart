import 'dart:async';

import 'package:cam_we_go/core/extensions.dart';
import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';
import '../../core/theme/colors.dart';

class Sam extends StatefulWidget {
  const Sam({super.key, this.dy});
  final double? dy;

  @override
  State<Sam> createState() => _SamState();
}

class _SamState extends State<Sam> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 300),
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, widget.dy ?? -30.h),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.context,
    required this.label,
    required this.size,
    required this.onTap,
  });

  final BuildContext context;
  final VoidCallback onTap;
  final String label;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.primaryColor,
        foregroundColor: Colors.black,
        textStyle: context.textTheme.titleLarge,
        fixedSize: size,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        elevation: 3,
      ),
      child: Text(label),
    );
  }

  static ElevatedButton icon({
    required FutureOr<void> Function() onTap,
    required BuildContext context,
    required String label,
    required Widget icon,
    required Gap gap,
    Color? backgroundColor,
    Color? foregroundColor,
    double? fontSize,
    Size? size,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? context.primaryColor,
        foregroundColor: foregroundColor ?? Colors.black,
        fixedSize: size,
        textStyle: context.textTheme.bodyLarge!.copyWith(
          fontSize: fontSize,
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        elevation: 3,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(width: gap.narrow),
          Text(label),
        ],
      ),
    );
  }

  static ElevatedButton outlinedBorderWithIcon({
    required VoidCallback onTap,
    required String label,
    required Icon icon,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.black.withOpacity(0),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: normal)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
          icon,
        ],
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({
    super.key,
    this.alignment,
    required this.title,
  });

  final String title;
  final TextAlign? alignment;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alignment,
      style:
          context.textTheme.headlineSmall!.copyWith(color: context.surfaceDim),
    );
  }
}

class InputField {
  const InputField();

  static TextFormField text({
    required BuildContext context,
    required String label,
    required String hintText,
    String? Function(String?)? validator,
    TextEditingController? controller,
    void Function(String?)? onSaved,
    required InputType type,
    String? initialValue,
    bool isFinal = false,
    bool readOnly = false,
  }) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: initialValue,
      keyboardType: _toTextInputType(type),
      obscureText: type == InputType.password,
      textCapitalization: type == InputType.text || type == InputType.report
          ? TextCapitalization.sentences
          : TextCapitalization.none,
      textInputAction: isFinal ? TextInputAction.send : TextInputAction.next,
      maxLines: type == InputType.report ? null : 1,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        labelText: label,
        // hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: type == InputType.password
            ? const Icon(Icons.remove_red_eye)
            : null,
      ),
      readOnly: readOnly,
      onSaved: onSaved,
      validator: validator,
    );
  }
}

TextInputType _toTextInputType(InputType type) {
  switch (type) {
    case InputType.email:
      return TextInputType.emailAddress;
    case InputType.number:
      return TextInputType.number;
    case InputType.password:
      return TextInputType.visiblePassword;
    case InputType.text:
      return TextInputType.text;
    case InputType.report:
      return TextInputType.multiline;
    case InputType.phone:
      return TextInputType.phone;
  }
}
