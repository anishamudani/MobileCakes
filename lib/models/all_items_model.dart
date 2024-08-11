class AllItemsModel {
  static List<Map<String, dynamic>> results = [];
  static List<Map<String, dynamic>> allItems = [
    {
      "name": "Iced cake",
      "image": "images/1.png",
      "price": 20,
      "size": "Medium",
      "rating": 5.0,
      "description": "Here is one of the mighty tasty cakes"
    },
    {
      "name": "Soft Cake",
      "image": "images/2.png",
      "price": 15,
      "size": "Medium",
      "rating": 5.0,
      "description": "Here is one of the mighty tasty cakes"
    },
    {
      "name": "Hard Cake",
      "image": "images/3.png",
      "price": 25,
      "size": "Medium",
      "rating": 5.0,
      "description": "Here is one of the mighty tasty cakes"
    },
    {
      "name": "Pan Cake",
      "image": "images/4.png",
      "price": 50,
      "size": "Medium",
      "rating": 5.0,
      "description": "Here is one of the mighty tasty cakes"
    },
    {
      "name": "Carrot Cake",
      "image": "images/5.png",
      "price": 30,
      "size": "Small",
      "rating": 5.0,
      "description": "Here is one of the mighty tasty cakes"
    },
    {
      "name": "Fruit Cake",
      "image": "images/6.png",
      "price": 65,
      "size": "Large",
      "rating": 5.0,
      "description": "Here is one of the mighty tasty cakes"
    },
    {
      "name": "Fruit Cake",
      "image": "images/7.png",
      "price": 30,
      "size": "Medium",
      "rating": 5.0,
      "description": "Here is one of the mighty tasty cakes"
    },
    {
      "name": "Black Forest Cake",
      "image": "images/8.png",
      "price": 25,
      "size": "Small",
      "rating": 5.0,
      "description": "Here is one of the mighty tasty cakes"
    },
    {
      "name": "Red Wine Cake",
      "image": "images/9.png",
      "price": 90,
      "size": "Small",
      "rating": 5.0,
      "description": "Here is one of the mighty tasty cakes"
    },
    {
      "name": "Grape Wine Cake",
      "image": "images/10.png",
      "price": 100,
      "size": "Medium",
      "rating": 5.0,
      "description": "Here is one of the mighty tasty cakes"
    },
    {
      "name": "Brown Cake",
      "image": "images/11.png",
      "price": 200,
      "size": "Small",
      "rating": 5.0,
      "description": "Here is one of the mighty tasty cakes"
    },
  ];

  static searchResults(String search){
    results = allItems.where(
            (item) => item['name'].toLowerCase().contains(
                search.toLowerCase())).toList();
  }

  static List getResults(){
    return results;
  }
}
