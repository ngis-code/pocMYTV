import 'package:flutter/material.dart';
import 'package:pocmytv/focus_system/focus_widget.dart';
import 'package:pocmytv/screens/account/account_info.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<String> gridItems = [
    'Your account list all transactions posted to your\nonboard account',
    "To view an individual's charges, select that\nguest's name.",
    "Paying by credit card? No further action is\nnecessary. Any outstanding balance will be\ncharged to your credit card.",
    "Paying by cash? Visit Guest Services by 11 p.m. the\nfinal night of your cruise to settle your account.",
    "If you have questions about your account, dial 0\non your stateroom phone or visit Guest Services\nprior to 8:30 a.m. on the final day of your cruise.",
    "Non-refundable onboard credits must be used\nprior to 10 pm the final night of your cruise or they\nwill be forfeited.",
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BackgroundVideo(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.withOpacity(.9),
                          Colors.white.withOpacity(.3),
                          Colors.blue.withOpacity(.9),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.5),
                      //     spreadRadius: 5,
                      //     blurRadius: 7,
                      //     offset: const Offset(0, 3),
                      //   ),
                      // ],
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Account",
                        style: TextStyle(
                          fontSize: height / 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: height / 10,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: height / 50),
                          itemCount: gridItems.length,
                          itemBuilder: (context, index) {
                            return FittedBox(
                              alignment: Alignment.centerLeft,
                              fit: BoxFit.contain,
                              child: Text(
                                '• ${gridItems[index]}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: height / 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    FocusWidget(
                      hasFocus: true,
                      focusGroup: 'account-group',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const AccountInformation();
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 20, left: 10, right: 10),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/image copy.png',
                              height: height / 5,
                              width: width / 7.5,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Landon".toUpperCase(),
                              style: TextStyle(
                                  fontSize: height / 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FocusWidget(
                      focusGroup: 'account-group',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const AccountInformation();
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 20, left: 10, right: 10),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/image copy.png',
                              height: height / 5,
                              width: width / 7.5,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Gabriel".toUpperCase(),
                              style: TextStyle(
                                  fontSize: height / 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
