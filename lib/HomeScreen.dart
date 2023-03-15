import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool searching = false;
  final List<Map<String, dynamic>> _itemListData = [
    {
      "imageUrl": "https://cdn-icons-png.flaticon.com/512/3665/3665909.png",
      "title": "Reliance"
    },
    {
      "imageUrl": "https://cdn-icons-png.flaticon.com/512/5977/5977591.png",
      "title": "Develop"
    },
    {
      "imageUrl": "https://cdn-icons-png.flaticon.com/512/5977/5977591.png",
      "title": "Enter"
    },
    {
      "imageUrl": "https://cdn-icons-png.flaticon.com/512/3665/3665917.png",
      "title": "Book"
    },
    {
      "imageUrl": "https://cdn-icons-png.flaticon.com/512/3665/3665923.png",
      "title": "Car"
    },
    {
      "imageUrl": "https://cdn-icons-png.flaticon.com/512/3665/3665909.png",
      "title": "Aakash"
    },
    {
      "imageUrl": "https://cdn-icons-png.flaticon.com/512/5977/5977591.png",
      "title": "Dawn"
    },
    {
      "imageUrl": "https://cdn-icons-png.flaticon.com/512/5977/5977591.png",
      "title": "Ebook"
    },
    {
      "imageUrl": "https://cdn-icons-png.flaticon.com/512/3665/3665917.png",
      "title": "Bit"
    },
    {
      "imageUrl": "https://cdn-icons-png.flaticon.com/512/3665/3665923.png",
      "title": "Close"
    },
    {
      "imageUrl": "https://cdn-icons-png.flaticon.com/512/3665/3665909.png",
      "title": "Absolute"
    },
    {
      "imageUrl": "https://cdn-icons-png.flaticon.com/512/5977/5977591.png",
      "title": "Done"
    },
    {
      "imageUrl": "https://cdn-icons-png.flaticon.com/512/5977/5977591.png",
      "title": "Extract"
    },
    {
      "imageUrl": "https://cdn-icons-png.flaticon.com/512/3665/3665917.png",
      "title": "Below"
    },
    {
      "imageUrl": "https://cdn-icons-png.flaticon.com/512/3665/3665923.png",
      "title": "Congratulations"
    },
  ];

  List<Map<String, dynamic>> _sortedList = [];
  @override
  void initState() {
    _sortedList = _itemListData;
    _sortedList.sort((item1, item2) {
      var r = item1["title"].compareTo(item2["title"]);
      if (r != 0) return r;
      return item1["title"].compareTo(item2["title"]);
    });
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      setState(() {
        searching = false;
      });

      results = _itemListData;
    } else {
      setState(() {
        searching = true;
      });
      results = _itemListData
          .where((user) => user["title"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _sortedList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onChanged: (value) {
                    _runFilter(value);
                  },
                ),
                searching
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Search Results"),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Latest"),
                          latestItem(0),
                          latestItem(1),
                          latestItem(2),
                        ],
                      ),
                searching
                    ? const SizedBox(
                        height: 1,
                      )
                    : const Text("All"),
                _sortedList.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: _sortedList.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.network(
                                    _sortedList[index]['imageUrl'],
                                    height: 60,
                                    width: 120,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(_sortedList[index]['title'])
                              ],
                            );
                          },
                        ),
                      )
                    : Container(
                        color: Colors.red,
                        height: 100,
                        child: const Center(child: Text("No Results Found")),
                      ),
              ]),
        ),
      ),
    );
  }

  Row latestItem(int index) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(10)),
          child: Image.network(
            _itemListData[index]['imageUrl'],
            height: 60,
            width: 120,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(_itemListData[index]['title']),
      ],
    );
  }
}
