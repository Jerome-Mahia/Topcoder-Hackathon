import 'package:flutter/material.dart';

class SearchWidget extends SearchDelegate<String> {
  final ValueChanged<String> onLocationSelected;

  SearchWidget({required this.onLocationSelected});

  List<String> searchableItems = [
    'Savings',
    'Current',
    'Fixed Deposit',
    'Nominated',
    'Personal',
  ];
  final TextEditingController searchController = TextEditingController();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          Navigator.pop(context);
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      onLocationSelected(query);
    }
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in searchableItems) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            close(context,
                result); // Return the selected value to the buildResults method
          },
        );
      },
    );
  }
}
