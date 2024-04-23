import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/utils/glass_widget.dart';

class QrButton extends StatelessWidget {
  const QrButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return FocusWidget(
      focusGroup: 'mailButton',
      onTap: () {
        showGeneralDialog(
          context: context,
          barrierColor: Colors.transparent,
          pageBuilder: (context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return Dialog(
              backgroundColor: Colors.black45,
              child: GlassWidget(
                radius: 20,
                backgroundColor: Colors.black26,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: math.min(height / 2, width / 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'TV On The Go'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          FocusWidget(
                            focusGroup: "closeBttn",
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            hasFocus: true,
                            child: const Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/qrcode.png',
                      fit: BoxFit.contain,
                      height: math.min(height / 2, width / 2),
                      width: math.min(height / 2, width / 2),
                    ),
                  ],
                ),
              ),
            );
          },
          barrierDismissible: false,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          transitionDuration: const Duration(milliseconds: 500),
          transitionBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: Tween<double>(
                begin: 0,
                end: 1,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
              ),
              child: child,
            );
          },
        );
      },
      borderRadius: 10,
      backgroundColor: Colors.black26,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Text(
            'TV On The Go'.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white),
          ),
          Expanded(
            child: Image.asset(
              'assets/images/qrcode.png',
              fit: BoxFit.contain,
              // width: 90,
              // height: 90,
            ),
          ),
        ],
      ),
    );
  }
}
