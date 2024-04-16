import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pocmytv/extensions/string_extensions.dart';
import 'package:pocmytv/grid_tile_logo.dart';
import 'package:pocmytv/models/complaint.dart/complaint_category.dart';
import 'package:pocmytv/screens/animation/bubble_animation.dart';
import 'package:pocmytv/screens/guest_service/complaint_form.dart';

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
      body: BubbleAnimation(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              if (category != null)
                SizedBox(
                  height: 200,
                  width: 200,
                  child: GridTileLogo(
                    title: category!.title,
                    icon: category!.image != null
                        ? Image.network(
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
                  category!.description!.replaceAll('_', ' ').toPascalCase(),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              Expanded(
                child: Center(
                  child: category?.subComplaintCategories.isEmpty == true
                      ? ComplaintForm(category: category!)
                      : SizedBox(
                          height: count * 200.0 + (count - 1) * 20.0,
                          width: count * 200.0 + (count - 1) * 20.0,
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: count,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            children: (category == null
                                    ? ComplaintCategory.categories
                                    : category!.subComplaintCategories)
                                .map(
                                  (subCategory) => SizedBox(
                                    height: 200,
                                    width: 200,
                                    child: GridTileLogo(
                                      title: subCategory.title,
                                      icon: subCategory.image != null
                                          ? Image.network(
                                              subCategory.image!,
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
                                                category: subCategory);
                                          },
                                        ));
                                      },
                                      color: Colors.blue.withOpacity(0.8),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
