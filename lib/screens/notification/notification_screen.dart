import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/notification/parallex_promotional_ads.dart';
import 'package:pocmytv/screens/notification/rate_bar.dart';
import 'package:pocmytv/utils/glass_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassWidget(
      borderRadius: 20,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Notifications',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        FocusWidget(
                          focusGroup: 'notifcation_close',
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    FocusWidget(
                      focusGroup: 'notifcations',
                      hasFocus: true,
                      onTap: () {},
                      child: const ListTile(
                        leading: Icon(
                          Icons.mail_outline_outlined,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Happy Birthday Landon, Enjoy 20% off at Chops!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '20% off on Gucci accessories only for you',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    FocusWidget(
                      focusGroup: 'notifcations',
                      onTap: () {},
                      child: const ListTile(
                        leading: Icon(
                          Icons.mail_outline_outlined,
                          color: Colors.white,
                        ),
                        title: Text(
                          'AI Promotional Guest2',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '20% off on Gucci accessories only for you',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Row(
                children: [
                  const Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: ParallerPromotionalAds(),
                  ),
                  const VerticalDivider(
                    color: Colors.white,
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Rate Your Experience While Onboard',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RateBar(
                            minRating: 1,
                            onRatingUpdate: (rating) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
