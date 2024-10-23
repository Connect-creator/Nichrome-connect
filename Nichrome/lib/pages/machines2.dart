class Machine {
  final String name;
  final String imageUrl;
  final List<String> categories; // e.g., ["Packaging Machines", "Filling Systems"]
  final String description; // Added description field

  Machine({
    required this.name,
    required this.imageUrl,
    required this.categories,
    required this.description, // Initialize description
  });
}

class MachineData {
  static List<Machine> allMachines = [
    Machine(
      name: 'Machine 1',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Sprint_250_Plus_Multihead_Weigher.jpg',
      categories: ['Packaging Machines', 'VFFS'],
      description: 'Machine 1 is used for high-speed packaging of food and pharma products.',
    ),
    Machine(
      name: 'Machine 2',
      imageUrl: 'https://example.com/machine2.png',
      categories: ['Packaging Systems', 'HFFS'],
      description: 'Machine 2 is designed for packaging non-food items with high precision.',
    ),
    Machine(
      name: 'Machine 3',
      imageUrl: 'https://example.com/machine3.png',
      categories: ['Filling Systems', 'VFFS', 'HFFS'],
      description: 'Machine 3 is a filling system, ideal for both food and non-food liquids.',
    ),
    // Add more machines with appropriate descriptions...
  ];

  // Method to return machines based on categories and VFFS/HFFS classification
  static Map<String, Map<String, List<Machine>>> getMachinesByCategory() {
    Map<String, List<Machine>> categoryMap = {
      'Packaging Machines': [],
      'Packaging Systems': [],
      'Filling Systems': [],
    };

    Map<String, List<Machine>> VFFS = {
      'Packaging Machines': [],
      'Packaging Systems': [],
      'Filling Systems': [],
    };

    Map<String, List<Machine>> HFFS = {
      'Packaging Machines': [],
      'Packaging Systems': [],
      'Filling Systems': [],
    };

    for (var machine in allMachines) {
      for (var category in categoryMap.keys) {
        if (machine.categories.contains(category)) {
          categoryMap[category]!.add(machine);

          if (machine.categories.contains('VFFS')) {
            VFFS[category]!.add(machine);
          }
          if (machine.categories.contains('HFFS')) {
            HFFS[category]!.add(machine);
          }
        }
      }
    }

    return {
      'allCategories': categoryMap,
      'VFFS': VFFS,
      'HFFS': HFFS,
    };
  }
}
