import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/stateroom/stateroom_automation.dart';

class StateroomLightWidget extends StatefulWidget {
  final String lightType;
  final IconData onIcon;
  final IconData offIcon;
  const StateroomLightWidget({
    super.key,
    required this.lightType,
    required this.onIcon,
    required this.offIcon,
  });

  @override
  State<StateroomLightWidget> createState() => _StateroomLightWidgetState();
}

class _StateroomLightWidgetState extends State<StateroomLightWidget> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: FocusWidget(
        onTap: () {
          setState(() {
            isOn = !isOn;
          });
        },
        borderRadius: 20,
        backgroundColor: tileBackgroundColor,
        padding: EdgeInsets.all(tilePadding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              isOn ? widget.onIcon : widget.offIcon,
              size: 50,
              color: isOn ? Colors.cyanAccent : Colors.blueGrey,
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  widget.lightType,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
