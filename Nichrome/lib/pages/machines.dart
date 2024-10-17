class Machine {
  final String name;
  final String imageUrl;
  final List<String> categories; // e.g., ["Packaging Machines", "Filling Systems"]
  final List<String> industries; // e.g., ["Food", "Pharma"]
  final String description; // Added description field

  Machine({
    required this.name,
    required this.imageUrl,
    required this.categories,
    required this.industries,
    required this.description, // Initialize description
  });
}

class MachineData {
  static List<Machine> allMachines = [
    Machine(
      name: 'Machine 1',
      imageUrl: 'https://www.nichrome.com/images/V10/machines/large/Sprint_250_Plus_Multihead_Weigher.jpg',
      categories: ['Packaging Machines'],
      industries: ['Grains', 'Milk'],
      description: 'Machine 1 is used for high-speed packaging of food and pharma products.',
    ),
    Machine(
      name: 'Machine 2',
      imageUrl: 'https://example.com/machine2.png',
      categories: ['Packaging Systems'],
      industries: ['Grains'],
      description: 'Machine 2 is designed for packaging non-food items with high precision.',
    ),
    Machine(
      name: 'Machine 3',
      imageUrl: 'https://example.com/machine3.png',
      categories: ['Filling Systems'],
      industries: ['Oil', 'Powders'],
      description: 'Machine 3 is a filling system, ideal for both food and non-food liquids.',
    ),
    // Add more machines with appropriate descriptions...
  ];

  // Method to return machines based on selected industry
  static Map<String, List<Machine>> getMachinesForIndustry(String industry) {
    List<Machine> packagingMachines = [];
    List<Machine> packagingSystems = [];
    List<Machine> fillingSystems = [];

    for (var machine in allMachines) {
      if (machine.industries.contains(industry)) {
        if (machine.categories.contains('Packaging Machines')) {
          packagingMachines.add(machine);
        }
        if (machine.categories.contains('Packaging Systems')) {
          packagingSystems.add(machine);
        }
        if (machine.categories.contains('Filling Systems')) {
          fillingSystems.add(machine);
        }
      }
    }

    return {
      'packagingMachines': packagingMachines,
      'packagingSystems': packagingSystems,
      'fillingSystems': fillingSystems,
    };
  }
}
