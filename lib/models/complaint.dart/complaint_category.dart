class ComplaintCategory {
  String title;
  String? description;
  List<ComplaintCategory> subComplaintCategories;
  List<String> options;
  String? image;
  bool showTextBox;

  ComplaintCategory({
    required this.title,
    this.description,
    this.subComplaintCategories = const [],
    this.options = const [],
    this.showTextBox = false,
    this.image,
  });

  ComplaintCategory copyWith({
    String? title,
    String? description,
    List<ComplaintCategory>? subComplaintCategories,
    List<String>? options,
    bool? showTextBox,
    bool? isTextBoxCompulsory,
    String? image,
  }) {
    return ComplaintCategory(
      title: title ?? this.title,
      description: description ?? this.description,
      subComplaintCategories:
          subComplaintCategories ?? this.subComplaintCategories,
      options: options ?? this.options,
      showTextBox: showTextBox ?? this.showTextBox,
      image: image ?? this.image,
    );
  }

  factory ComplaintCategory.fromJson(Map<String, dynamic> json) {
    return ComplaintCategory(
      title: json['title'],
      description: json['description'],
      subComplaintCategories: (json['subComplaintCategories'] as List)
          .map((e) => ComplaintCategory.fromJson(e))
          .toList(),
      options: (json['options'] as List).map((e) => e.toString()).toList(),
      showTextBox: json['showTextBox'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'subComplaintCategories':
          subComplaintCategories.map((e) => e.toJson()).toList(),
      'options': options,
      'showTextBox': showTextBox,
      'image': image,
    };
  }

  static final List<ComplaintCategory> categories = [
    ComplaintCategory(
      title: "Room Facilities and Amenities",
      subComplaintCategories: [
        ComplaintCategory(
          title: "cleanliness",
          description: "Issues related to cleanliness",
          options: [
            "room",
            "bathroom",
            "linens",
            "carpet/flooring",
            "furniture",
            "windows",
            "overall cleanliness"
          ],
        ),
        ComplaintCategory(
          subComplaintCategories: [],
          title: "maintenance",
          description:
              "Complaints about malfunctioning appliances, broken furniture, plumbing issues, etc.",
          options: [
            "appliances (TV, coffee maker, etc.)",
            "furniture",
            "plumbing (leaks, clogs, etc.)",
            "electrical (outlets, lights, etc.)",
            "HVAC (heating, ventilation, air conditioning)",
            "door locks/handles",
            "shower/toilet fixtures"
          ],
        ),
        ComplaintCategory(
          subComplaintCategories: [],
          title: "room_size_comfort",
          description:
              "Concerns regarding the size of the room, comfort of the bed, noise levels, etc.",
          options: [
            "room size",
            "bed comfort",
            "noise levels",
            "lighting",
            "ventilation"
          ],
        ),
        ComplaintCategory(
          subComplaintCategories: [],
          title: "temperature_control",
          description:
              "Problems with heating, cooling, or ventilation systems.",
          options: [
            "heating",
            "cooling",
            "ventilation",
          ],
        ),
      ],
    ),
    ComplaintCategory(
      title: "Service Quality",
      subComplaintCategories: [
        ComplaintCategory(
          subComplaintCategories: [],
          title: "staff_behavior",
          description:
              "Complaints about the attitude, responsiveness, or professionalism of the staff.",
          options: [
            "attitude",
            "responsiveness",
            "professionalism",
            "communication"
          ],
        ),
        ComplaintCategory(
          subComplaintCategories: [],
          title: "response_time",
          description:
              "Issues with delays in fulfilling requests or addressing complaints.",
          options: [
            "room service",
            "maintenance requests",
            "complaint resolution",
          ],
        ),
        ComplaintCategory(
          subComplaintCategories: [],
          title: "accuracy_of_information",
          description:
              "Misinformation provided by staff regarding services, facilities, or policies.",
          options: [
            "services",
            "facilities",
            "policies",
            "charges/fees",
          ],
        ),
      ],
    ),
    ComplaintCategory(
      title: "Hygiene and Safety",
      subComplaintCategories: [
        ComplaintCategory(
          subComplaintCategories: [],
          title: "pest_infestation",
          description: "Reports of insects or rodents in the room.",
          options: [
            "insects",
            "rodents"
                "safety_hazards"
          ],
        ),
        ComplaintCategory(
          subComplaintCategories: [],
          title: "safety_hazards",
          description:
              "Concerns about faulty electrical outlets, slippery floors, loose handrails, etc.",
          options: [
            "electrical hazards",
            "slippery floors",
            "loose handrails",
            "sharp edges",
            "fire hazards"
          ],
        ),
        ComplaintCategory(
          subComplaintCategories: [],
          title: "health_concerns",
          description:
              "Allergies triggered by room conditions, inadequate sanitation measures, etc.",
          options: [
            "allergens",
            "sanitation",
            "mold/mildew",
            "air quality",
          ],
        ),
      ],
    ),
    ComplaintCategory(
      title: "Room Features and Technology",
      subComplaintCategories: [
        ComplaintCategory(
          subComplaintCategories: [],
          title: "internet_connectivity",
          description:
              "Complaints about slow or unreliable Wi-Fi, connectivity issues, etc.",
          options: [
            "Wi-Fi speed",
            "connection stability",
            "coverage",
          ],
        ),
        ComplaintCategory(
          subComplaintCategories: [],
          title: "entertainment_system",
          description:
              "Problems with the TV, remote control, sound quality, etc.",
          options: [
            "TV functionality",
            "remote control",
            "sound quality",
            "channel selection"
          ],
        ),
        ComplaintCategory(
          subComplaintCategories: [],
          title: "appliance_functionality",
          description: "Issues with the minibar, coffee maker, safe, etc.",
          options: [
            "minibar",
            "coffee maker",
            "safe",
            "microwave",
          ],
        ),
      ],
    ),
    ComplaintCategory(
      title: "Billing and Pricing",
      subComplaintCategories: [
        ComplaintCategory(
          subComplaintCategories: [],
          title: "overcharging",
          description:
              "Disputes regarding incorrect charges or unauthorized expenses.",
          options: [
            "room charges",
            "mini-bar charges",
            "service charges",
            "additional fees"
          ],
        ),
        ComplaintCategory(
          subComplaintCategories: [],
          title: "billing_errors",
          description: "Inaccuracies in the final bill, double-charging, etc.",
          options: [
            "incorrect charges",
            "double charges",
            "missing charges",
          ],
        ),
        ComplaintCategory(
          subComplaintCategories: [],
          title: "price_transparency",
          description:
              "Complaints about hidden fees or unclear pricing policies.",
          options: [
            "hidden fees",
            "unclear pricing",
            "misleading advertising",
          ],
        ),
      ],
    ),
    ComplaintCategory(
      title: "Accessibility and Special Needs",
      subComplaintCategories: [
        ComplaintCategory(
          subComplaintCategories: [],
          title: "accessibility",
          description:
              "Problems faced by guests with disabilities in accessing and using room facilities.",
          options: [
            "wheelchair accessibility",
            "grab bars",
            "visual impairment accommodations",
            "auditory impairment accommodations"
          ],
        ),
        ComplaintCategory(
          subComplaintCategories: [],
          title: "special_requests",
          description:
              "Failure to fulfill requests for specific accommodations.",
          options: [
            "extra pillows/blankets",
            "bed type preferences",
            "room location preferences",
            "dietary restrictions"
          ],
        ),
      ],
    ),
    ComplaintCategory(
      title: "Noise and Disturbances",
      subComplaintCategories: [
        ComplaintCategory(
          subComplaintCategories: [],
          title: "noise_disturbance",
          description:
              "Complaints about loud neighbors, construction noise, partying in adjacent rooms, etc.",
          options: [
            "loud neighbors",
            "construction noise",
            "party noise",
            "outside noise"
          ],
        ),
        ComplaintCategory(
          subComplaintCategories: [],
          title: "view_quality",
          description: "Dissatisfaction with the view from the room.",
          options: [
            "obstructed view",
            "undesirable scenery",
            "no view",
          ],
        ),
        ComplaintCategory(
          subComplaintCategories: [],
          title: "room_odors",
          description: "Unpleasant smells in the room, bathroom, or corridor.",
          options: [
            "cigarettesmoke",
            "mold/mildew",
            "musty odor",
            "chemical odor",
          ],
        ),
      ],
    ),
    ComplaintCategory(
      title: "Privacy and Security",
      subComplaintCategories: [
        ComplaintCategory(
          subComplaintCategories: [],
          title: "privacy_intrusion",
          description:
              "Concerns about unauthorized entry into the room, inadequate locks, etc.",
          options: [
            "inadequate locks",
            "staff entry without permission",
            "privacy curtains/doors not closing properly"
          ],
        ),
        ComplaintCategory(
          subComplaintCategories: [],
          title: "security_issues",
          description:
              "Theft or loss of personal belongings, feeling unsafe due to lack of security measures.",
          options: [
            "theft",
            "lost items",
            "lack of security cameras",
            "unsecured doors/windows"
          ],
        ),
      ],
    ),
  ];
}
