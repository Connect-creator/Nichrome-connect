import 'package:flutter/material.dart';
import '../screens/subcategoriesdetails.dart';
import 'machines2.dart'; // Import the machine data

class MachineListScreen extends StatelessWidget {
  final String categoryName;
  final Map<String, Map<String, List<Machine>>> machinesByCategory;

  MachineListScreen({
    required this.categoryName,
    required this.machinesByCategory,
  });

  @override
  Widget build(BuildContext context) {
    final allMachines = machinesByCategory['allCategories']![categoryName] ?? [];
    final vffsMachines = machinesByCategory['VFFS']![categoryName] ?? [];
    final hffsMachines = machinesByCategory['HFFS']![categoryName] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text('$categoryName Machines')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          if (allMachines.isNotEmpty) _buildSubcategorySection(context, 'All', allMachines),
          if (vffsMachines.isNotEmpty) _buildSubcategorySection(context, 'VFFS', vffsMachines),
          if (hffsMachines.isNotEmpty) _buildSubcategorySection(context, 'HFFS', hffsMachines),
        ],
      ),
    );
  }

  // Helper method to build subcategory (e.g., VFFS, HFFS) section
  Widget _buildSubcategorySection(BuildContext context, String subcategory, List<Machine> machineList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(subcategory, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        Wrap(
          spacing: 10,
          children: machineList.map((machine) {
            return _buildMachineCard(context, machine);
          }).toList(),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  // Method to build machine card with image and name
  Widget _buildMachineCard(BuildContext context, Machine machine) {
    return GestureDetector(
      onTap: () {
        // Navigate to the details page with machine details
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubcategoryDetailsScreen(
              categoryName: machine.categories.join(', '), // Show multiple categories if applicable
              subcategoryName: machine.name,
              subcategoryImageUrl: machine.imageUrl,
              subcategoryDescription: machine.description,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          width: 100, // Width for each card
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(machine.imageUrl, height: 50), // Display machine image
              SizedBox(height: 8),
              Text(
                machine.name,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ), // Display machine name
            ],
          ),
        ),
      ),
    );
  }
}
