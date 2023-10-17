import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  const HomeScreen({super.key, required this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String dropDownValue = "This year";
  DateTime? selectedDateRange;
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF4D3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBF4D3),
        title: DropdownButton<String>(
          dropdownColor: const Color(0xFFF9F4E8),
          value: dropDownValue,
          items: <String>[
            'Today',
            'This week',
            'This month',
            'This year',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  color: dropDownValue == value
                      ? Colors.red
                      : null, // Change the color here
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            dropDownValue = newValue!;
          },
        ),
      ),
      drawer: Drawer(),
      body: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Center(
                child: TextField(
                  controller: searchController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search notes",
                    prefixIcon: Icon(Icons.search),
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Column(
              children: [
                Card(
                  child: ListTile(
                    title: Text(
                      "Introduction to app development using flutter",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Over the years, flutter programming has gained popularity",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("2023-10-17 12:54")
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
