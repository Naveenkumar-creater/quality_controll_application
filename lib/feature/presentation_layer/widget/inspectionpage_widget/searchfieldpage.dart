import 'package:flutter/material.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/inspectionpage_widget/searchfield_widget.dart';

class SearchFieldExample extends StatefulWidget {
  @override
  _SearchFieldExampleState createState() => _SearchFieldExampleState();
}

class _SearchFieldExampleState extends State<SearchFieldExample> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _items = ["Apple", "Banana", "Cherry", "Date", "Elderberry"];
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _items; // Initially, show all items
  }
  
  void _onSearchChanged(String query) {
    setState(() {
      _filteredItems = _items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Field Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchField(
              controller: _searchController,
              onChanged: _onSearchChanged,
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredItems[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


