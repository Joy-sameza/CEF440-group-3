import 'dart:async';

import 'package:cam_we_go/core/extensions.dart';
import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';

class Sam extends StatefulWidget {
  const Sam({super.key});

  @override
  State<Sam> createState() => _SamState();
}

class _SamState extends State<Sam> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
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
  final FutureOr<void> Function() onTap;
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
    required Icon icon,
    required Gap gap,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.primaryColor,
        foregroundColor: Colors.black,
      ),
      child: Row(
        children: [
          icon,
          SizedBox(width: gap.narrow),
          Text(label),
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
      style: context.textTheme.headlineLarge!
          .copyWith(color: context.surfaceDim),
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
    required TextEditingController controller,
    required InputType type,
    bool isFinal = false,
  }) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
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
