import 'package:flutter/cupertino.dart';

class ProductHome {
  final List<String>? imageUrls;
  final String? planetName;
  final String? planetScientefic;
  final String? planetDescriotion;
  final String? planetType;
  final String? plantPricing;
  final String? FlowerColor;
  final String? LeafColor;
  
  final String? wateringFrequency;
  final String? Fertilizing;
  final String? humidity;
  final String? temperature;
  final String? lightNeeded;
  final String? difficult;
  final String? cleaning;
  final String? Place;
  final String? idPlants;
  bool isFavorite;
  ProductHome({
    this.imageUrls,
    this.planetName,
    this.planetScientefic,
    this.planetDescriotion,
    this.planetType,
    this.plantPricing,
    this.FlowerColor,
    this.LeafColor,
    
    this.wateringFrequency,
    this.Fertilizing,
    this.humidity,
    this.temperature,
    this.lightNeeded,
    this.difficult,
    this.cleaning,
    this.Place,
    this.idPlants,
    this.isFavorite = false,
  });

  factory ProductHome.fromJson(Map<String, dynamic> json) {
    List<String> extractImageUrls(dynamic imageUrlData) {
      if (imageUrlData is List) {
        return List<String>.from(imageUrlData);
      } else {
        return [];
      }
    }

    return ProductHome(
      imageUrls: extractImageUrls(json['imageUrls']),
      planetName: json['planetName'] ?? '',
      planetScientefic: json['planetScientefic'] ?? '',
      planetDescriotion: json['planetDescriotion'] ?? '',
      planetType: json['planetType'] ?? '',
      plantPricing: json['plantPricing'] ?? '',
      FlowerColor: json['FlowerColor'] ?? '',
      LeafColor: json['LeafColor'] ?? '',
      
      wateringFrequency: json['wateringFrequency'] ?? '',
      Fertilizing: json['Fertilizing'] ?? '',
      humidity: json['humidity'] ?? '',
      temperature: json['temperature'] ?? '',
      lightNeeded: json['lightNeeded'] ?? '',
      difficult: json['difficult'] ?? '',
      cleaning: json['cleaning'] ?? '',
      Place: json['Place'] ?? '',
      idPlants: json['idPlants'] ?? '',
      isFavorite: json['isFavorite'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'imageUrls': imageUrls,
      'isFavorite': isFavorite,
      'planetName': planetName,
      'planetScientefic': planetScientefic,
      'planetDescriotion': planetDescriotion,
      'planetType': planetType,
      'plantPricing': plantPricing,
      'FlowerColor': FlowerColor,
      'LeafColor': LeafColor,
      
      'wateringFrequency': wateringFrequency,
      'Fertilizing': Fertilizing,
      'humidity': humidity,
      'temperature': temperature,
      'lightNeeded': lightNeeded,
      'difficult': difficult,
      'cleaning': cleaning,
      'Place': Place,
      'idPlants': idPlants,
    };
  }
  // Method to get a list of Image.network widgets
  List<Widget> getImageWidgets() {
    return [
      for (String imageUrl in imageUrls!)
        Image.network(imageUrl, width: 100, height: 100),
    ];
  }
}
class   ProductCart {
  final List<String>? imageUrls;
  final String? planetName;
  final String? planetScientefic;
  final String? planetDescriotion;
  final String? planetType;
  final String? plantPricing;
  final String? FlowerColor;
  final String? LeafColor;
  
  final String? wateringFrequency;
  final String? Fertilizing;
  final String? humidity;
  final String? temperature;
  final String? lightNeeded;
  final String? difficult;
  final String? cleaning;
  final String? idPlants;

  ProductCart({
    this.imageUrls,
    this.planetName,
    this.planetScientefic,
    this.planetDescriotion,
    this.planetType,
    this.plantPricing,
    this.FlowerColor,
    this.LeafColor,
  
    this.wateringFrequency,
    this.Fertilizing,
    this.humidity,
    this.temperature,
    this.lightNeeded,
    this.difficult,
    this.cleaning,
    this.idPlants,
  });

  factory ProductCart.fromJson(Map<String, dynamic> json) {
    List<String> extractImageUrls(dynamic imageUrlData) {
      if (imageUrlData is List) {
        return List<String>.from(imageUrlData);
      } else {
        return [];
      }
    }

    return ProductCart(
      imageUrls: extractImageUrls(json['imageUrls']),
      planetName: json['planetName'] ?? '',
      planetScientefic: json['planetScientefic'] ?? '',
      planetDescriotion: json['planetDescriotion'] ?? '',
      planetType: json['planetType'] ?? '',
      plantPricing: json['plantPricing'] ?? '',
      FlowerColor: json['FlowerColor'] ?? '',
      LeafColor: json['LeafColor'] ?? '',
    
      wateringFrequency: json['wateringFrequency'] ?? '',
      Fertilizing: json['Fertilizing'] ?? '',
      humidity: json['humidity'] ?? '',
      temperature: json['temperature'] ?? '',
      lightNeeded: json['lightNeeded'] ?? '',
      difficult: json['difficult'] ?? '',
      cleaning: json['cleaning'] ?? '',
      idPlants: json['idPlants'] ?? '',
    );
  }

  // Method to get a list of Image.network widgets
  List<Widget> getImageWidgets() {
    return [
      for (String imageUrl in imageUrls!)
        Image.network(imageUrl, width: 100, height: 100),
    ];
  }
}
class ProductFavorite {
  final List<String>? imageUrls;
  final String? planetName;
  final String? planetScientefic;
  final String? planetDescriotion;
  final String? planetType;
  final String? plantPricing;
  final String? FlowerColor;
  final String? LeafColor;
  
  final String? wateringFrequency;
  final String? Fertilizing;
  final String? humidity;
  final String? temperature;
  final String? lightNeeded;
  final String? difficult;
  final String? cleaning;
  final String? Place;
  final String? idPlants;
  bool isFavorite;
  ProductFavorite({
    this.imageUrls,
    this.planetName,
    this.planetScientefic,
    this.planetDescriotion,
    this.planetType,
    this.plantPricing,
    this.FlowerColor,
    this.LeafColor,
    
    this.wateringFrequency,
    this.Fertilizing,
    this.humidity,
    this.temperature,
    this.lightNeeded,
    this.difficult,
    this.cleaning,
    this.Place,
    this.idPlants,
    this.isFavorite = false,
  });

  factory ProductFavorite.fromJson(Map<String, dynamic> json) {
    List<String> extractImageUrls(dynamic imageUrlData) {
      if (imageUrlData is List) {
        return List<String>.from(imageUrlData);
      } else {
        return [];
      }
    }

    return ProductFavorite(
      imageUrls: extractImageUrls(json['imageUrls']),
      planetName: json['planetName'] ?? '',
      planetScientefic: json['planetScientefic'] ?? '',
      planetDescriotion: json['planetDescriotion'] ?? '',
      planetType: json['planetType'] ?? '',
      plantPricing: json['plantPricing'] ?? '',
      FlowerColor: json['FlowerColor'] ?? '',
      LeafColor: json['LeafColor'] ?? '',
      
      wateringFrequency: json['wateringFrequency'] ?? '',
      Fertilizing: json['Fertilizing'] ?? '',
      humidity: json['humidity'] ?? '',
      temperature: json['temperature'] ?? '',
      lightNeeded: json['lightNeeded'] ?? '',
      difficult: json['difficult'] ?? '',
      cleaning: json['cleaning'] ?? '',
      Place: json['Place'] ?? '',
      idPlants: json['idPlants'] ?? '',
      isFavorite: json['isFavorite'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'imageUrls': imageUrls,
      'isFavorite': isFavorite,
      'planetName': planetName,
      'planetScientefic': planetScientefic,
      'planetDescriotion': planetDescriotion,
      'planetType': planetType,
      'plantPricing': plantPricing,
      'FlowerColor': FlowerColor,
      'LeafColor': LeafColor,
      
      'wateringFrequency': wateringFrequency,
      'Fertilizing': Fertilizing,
      'humidity': humidity,
      'temperature': temperature,
      'lightNeeded': lightNeeded,
      'difficult': difficult,
      'cleaning': cleaning,
      'Place': Place,
      'idPlants': idPlants,
    };
  }
  // Method to get a list of Image.network widgets
  List<Widget> getImageWidgets() {
    return [
      for (String imageUrl in imageUrls!)
        Image.network(imageUrl, width: 100, height: 100),
    ];
  }
}
class disease {
  final List<String>? imageUrls;
  final String? diseaseName;
  final String? description;
  disease({
    this.imageUrls,
    this.diseaseName,
    this.description,

  });

  factory disease.fromJson(Map<String, dynamic> json) {
    List<String> extractImageUrls(dynamic imageUrlData) {
      if (imageUrlData is List) {
        return List<String>.from(imageUrlData);
      } else {
        return [];
      }
    }

    return disease(
      imageUrls: extractImageUrls(json['imageUrl']),
      diseaseName: json['diseaseName'] ?? " ",
      description: json['description'] ?? " ",

    );
  }
  // Method to get a list of Image.network widgets
  List<Widget> getImageWidgets() {
    return [
      for (String imageUrl in imageUrls!)
        Image.network(imageUrl, width: 100, height: 100),
    ];
  }
}