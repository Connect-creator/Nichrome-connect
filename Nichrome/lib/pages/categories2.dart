import 'package:flutter/material.dart';
import 'machine_list_screen.dart';
import 'machines2.dart'; // Import the machine data

class MachineCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the machines categorized by VFFS, HFFS, and general categories
    final machinesByCategory = MachineData.getMachinesByCategory();

    return Scaffold(
      appBar: AppBar(title: Text('Machines by Category')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildCategorySection(context, "Packaging Machines", machinesByCategory),
          _buildCategorySection(context, "Packaging Systems", machinesByCategory),
          _buildCategorySection(context, "Filling Systems", machinesByCategory),
        ],
      ),
    );
  }

  // Helper method to build each category section
  Widget _buildCategorySection(BuildContext context, String categoryName, Map<String, Map<String, List<Machine>>> machinesByCategory) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            // Navigate to the machine list page for the selected category
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MachineListScreen(
                  categoryName: categoryName,
                  machinesByCategory: machinesByCategory, // Pass the machines data
                ),
              ),
            );
          },
          child: Text(
            categoryName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
