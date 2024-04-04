import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> gridItems = [
      'Your account list all transactions posted to your\nonboard account',
      "To view an individual's charges, select that\nguest's name.",
      "Paying by credit card? No further action is\nnecessary. Any outstanding balance will be\ncharged to your credit card.",
      "Paying by cash? Visit Guest Services by 11 p.m. the\nfinal night of your cruise to settle your account.",
      "If you have questions about your account, dial 0\non your stateroom phone or visit Guest Services\nprior to 8:30 a.m. on the final day of your cruise.",
      "Non-refundable onboard credits must be used\nprior to 10 pm the final night of your cruise or they\nwill be forfeited.",
    ];
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(20),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Account",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 50,
                              crossAxisCount: 2,
                              crossAxisSpacing: 40,
                              mainAxisSpacing: 5),
                      itemCount: gridItems.length,
                      itemBuilder: (context, index) {
                        return Text(
                          gridItems[index],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                Container(
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
                      Image.network(
                        'https://png.pngtree.com/png-clipart/20220301/ourmid/pngtree-d-rendering-male-character-profile-with-green-mint-sweater-blue-eyes-png-image_4466258.png',
                        height: 200,
                        width: 200,
                      ),
                      Text(
                        "Male".toUpperCase(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
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
                      Image.network(
                        'https://png.pngtree.com/png-clipart/20220403/ourmid/pngtree-d-rendering-cute-female-character-avatar-wearing-teal-turtle-neck-and-png-image_4525921.png',
                        height: 200,
                        width: 200,
                      ),
                      Text(
                        "Female".toUpperCase(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
