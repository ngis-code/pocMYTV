import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/notification/notification_screen.dart';

class MailButton extends StatelessWidget {
  const MailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FocusWidget(
      focusGroup: 'mailButton',
      onTap: () {
        showGeneralDialog(
          context: context,
          barrierColor: Colors.transparent,
          pageBuilder: (context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return const Dialog(
                backgroundColor: Colors.black45, child: NotificationScreen());
          },
          barrierDismissible: true,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          transitionDuration: const Duration(milliseconds: 500),
          transitionBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -1),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
              ),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(0, -1),
                ).animate(
                  CurvedAnimation(
                    parent: secondaryAnimation,
                    curve: Curves.easeInOut,
                  ),
                ),
                child: child,
              ),
            );
          },
        );
      },
      child: const Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(
            Icons.mail_outline_outlined,
            size: 35,
            color: Colors.white,
          ),
          Positioned(
            bottom: -5,
            left: 10,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 10,
              child: Text(
                "2",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
