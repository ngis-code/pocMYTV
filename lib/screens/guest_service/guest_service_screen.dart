import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pocmytv/extensions/string_extensions.dart';
import 'package:pocmytv/grid_tile_logo.dart';
import 'package:pocmytv/models/complaint.dart/complaint_category.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';
import 'package:pocmytv/screens/background.dart/background_video.dart';
import 'package:pocmytv/screens/guest_service/complaint_form.dart';
import 'package:pocmytv/screens/guest_service/complaints_list.dart';

class GuestServiceScreen extends StatelessWidget {
  final ComplaintCategory? category;

  const GuestServiceScreen({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    final categoryList = (category == null
        ? ComplaintCategory.categories
        : category!.subComplaintCategories);
    final count = math.sqrt(categoryList.length).ceilToDouble().toInt();
    return Scaffold(
      body: BackgroundVideo(
        backgroundWidget: Container(),
        child: BubbleAnimation(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                if (category == null) const ComplaintsList(),
                Expanded(
                  child: Column(
                    children: [
                      if (category != null)
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: GridTileLogo(
                            title: category!.title,
                            icon: category!.image != null
                                ? Image.asset(
                                    category!.image!,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(
                                    Icons.info,
                                    color: Colors.white,
                                    size: 80,
                                  ),
                            color: Colors.blue.withOpacity(0.8),
                          ),
                        ),
                      if (category?.description != null)
                        Text(
                          category!.description!
                              .replaceAll('_', ' ')
                              .toPascalCase(),
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      Expanded(
                        child: Center(
                          child: category?.subComplaintCategories.isEmpty ==
                                  true
                              ? ComplaintForm(category: category!)
                              : SizedBox(
                                  height: count * 200.0 + (count - 1) * 20.0,
                                  width: count * 200.0 + (count - 1) * 20.0,
                                  child: GridView.count(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    crossAxisCount: count,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    clipBehavior: Clip.none,
                                    children: [
                                      for (int i = 0;
                                          i < categoryList.length;
                                          i++)
                                        SizedBox(
                                          height: 200,
                                          width: 200,
                                          child: GridTileLogo(
                                            hasFocus: i == 0,
                                            title: categoryList[i].title,
                                            icon: categoryList[i].image != null
                                                ? Image.asset(
                                                    categoryList[i].image!,
                                                    fit: BoxFit.cover,
                                                  )
                                                : const Icon(
                                                    Icons.info,
                                                    color: Colors.white,
                                                    size: 80,
                                                  ),
                                            onTap: () async {
                                              await Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) {
                                                  return GuestServiceScreen(
                                                      category:
                                                          categoryList[i]);
                                                },
                                              ));
                                            },
                                            color: Colors.blue.withOpacity(0.8),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
