import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:styled_widget/styled_widget.dart';

class Button extends HookConsumerWidget {
  final String text;
  final Function() onTapped;
  final bool isActive, isPrimaryColor;

  const Button({
    required this.text,
    required this.onTapped,
    this.isActive = true,
    this.isPrimaryColor = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pressed = useState(false);

    Widget _primaryButtonText() => Container(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        );

    Widget _primaryButton() => Styled.widget(child: _primaryButtonText())
        .alignment(Alignment.center)
        .ripple(enable: isActive)
        .backgroundLinearGradient(
          animate: true,
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
          colors: [
            HexColor('#FF598B'),
            HexColor('#FF8D86'),
          ],
        )
        .clipRRect(all: 20)
        .borderRadius(all: 20, animate: true)
        .elevation(
          isActive && pressed.value ? 0 : 10,
          borderRadius: BorderRadius.circular(20),
          shadowColor: Colors.white,
        )
        .constrained(height: 80)
        .height(62)
        .width(310)
        .gestures(
          onTapChange: (tapStatus) => pressed.value = tapStatus,
          onTap: () => isActive ? onTapped() : null,
        )
        .scale(all: isActive && pressed.value ? 0.95 : 1.0, animate: true)
        .animate(Duration(milliseconds: 150), Curves.easeOut);

    Widget _secondlyButtonText() => Container(
          alignment: Alignment.center,
          child: GradientText(
            text,
            colors: isActive
                ? [
                    HexColor('#FF598B'),
                    HexColor('#FF8D86'),
                  ]
                : [
                    HexColor('#FBD4D4'),
                    HexColor('#FBD4D4'),
                  ],
            gradientDirection: GradientDirection.ttb,
            gradientType: GradientType.linear,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
        );

    Widget _secondlyButton() => Styled.widget(child: _secondlyButtonText())
        .alignment(Alignment.center)
        .ripple(enable: isActive)
        .backgroundColor(isActive ? Colors.white : HexColor('#FFA3AF'),
            animate: true)
        .clipRRect(all: 20)
        .borderRadius(all: 20, animate: true)
        .elevation(
          isActive && pressed.value ? 0 : 10,
          borderRadius: BorderRadius.circular(20),
          shadowColor: Colors.white,
        )
        .constrained(height: 80)
        .height(62)
        .width(310)
        .gestures(
          onTapChange: (tapStatus) => pressed.value = tapStatus,
          onTap: () => isActive ? onTapped() : null,
        )
        .scale(all: isActive && pressed.value ? 0.95 : 1.0, animate: true)
        .animate(Duration(milliseconds: 150), Curves.easeOut);

    return isPrimaryColor ? _primaryButton() : _secondlyButton();
  }
}
