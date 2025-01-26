```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      for (var item in data) {
        // Check if the key exists before accessing it.
        final id = item['id'];
        if (id != null) {
          // Process the id
          print('ID: $id');
        } else {
          // Handle the case where the 'id' key is missing
          print('Warning: "id" key is missing in item: $item');
          // Or you could take other actions like skipping this item 
        }
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    rethrow; //Re-throw the error for higher level handling
  }
}
```