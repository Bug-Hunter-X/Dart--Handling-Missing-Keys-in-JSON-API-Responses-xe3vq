```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming the response is a JSON list
      final List<dynamic> data = jsonDecode(response.body);
      // Process the data (e.g., update a state variable)
      // For example if your data is in the format [{'id':1, 'name':'Example'}] 
      // and you are trying to access the id using the below code
      for (var item in data) {
        int id = item['id']; // This line will throw an error if the 'id' key is missing
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle the exception appropriately
    print('Error fetching data: $e');
    // Consider rethrowing for higher level handling
    rethrow;
  }
}
```