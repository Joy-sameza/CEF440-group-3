import 'dart:async';

import 'package:cam_we_go/core/extensions.dart';
import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';
import '../../core/utils/constant.dart';
import '../../core/utils/enum.dart';

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
    Size size = const Size(350, 45),
    bool elevated = false,
    bool centered = false,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: elevated ? 3 : 0,
          fixedSize: size,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: normal),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )),
      child: Row(
        mainAxisAlignment: centered
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
          icon,
        ],
      ),
    );
  }

  static ElevatedButton outlinedBorder({
    required VoidCallback onTap,
    required String label,
    required Size size,
    Color color = normalActive,
    bool isElevated = false,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: color),
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        elevation: isElevated ? 3 : 0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: normal),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 20),
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
    // TextEditingController? controller,
    void Function(String?)? onSaved,
    required InputType type,
    String? initialValue,
    Widget? suffixIcon,
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
        suffixIcon: suffixIcon,
      ),
      readOnly: readOnly,
      onSaved: onSaved,
      validator: validator ?? (value) => customInputValidator(value, type),
    );
  }
}

class OutinedBorderedContainer extends StatelessWidget {
  const OutinedBorderedContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.fromBorderSide(BorderSide(color: normal)),
      ),
      child: child,
    );
  }
}

class IconWithLabel extends StatelessWidget {
  const IconWithLabel(
      {super.key, required this.icon, required this.label, this.color});

  final IconData icon;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: color ?? context.primaryColor,
          applyTextScaling: true,
        ),
        SizedBox(width: 1.w),
        Text(
          label,
          style: context.textTheme.bodyLarge!.copyWith(
            color: color ?? context.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}


String? customInputValidator(String? value, InputType type) {
  switch (type) {
    case InputType.email:
      if (value == null || value.isEmpty) {
        return 'Enter an Email address';
      }
      final emailRegex =
          RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
      if (!emailRegex.hasMatch(value)) {
        return 'Enter a valid email address';
      }
      return null;
    case InputType.number:
      if (value == null || value.isEmpty) {
        return 'Enter a number';
      }
      if (!double.tryParse(value)!.isFinite) {
        return 'Enter a valid number';
      }
      return null;
    case InputType.password:
      if (value == null || value.isEmpty) {
        return 'Enter a password';
      }
      if (!(value.length >= 8 && value.length <= 12)) {
        return 'Password should be between 8 and 12 characters';
      }
      return null;
    case InputType.text:
      if (value == null || value.isEmpty) {
        return 'Enter a user name';
      }
      if (value.length < 3) {
        return 'User name should be atleast 3 characters';
      }
      return null;
    case InputType.report:
      if (value == null || value.isEmpty) {
        return 'Enter a report';
      }
      return null;
    case InputType.phone:
      if (value == null || value.isEmpty) {
        return 'Enter a phone number';
      }
      final numRegex = RegExp(r'^[62][2-9]\d{7}$');
      if (numRegex.hasMatch(value)) {
        return 'Enter a valid phone number';
      }
      return null;
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
