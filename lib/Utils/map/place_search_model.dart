class PlaceSearch {
  final String? description;
  final String? placeId;
  final String? mainText;

  PlaceSearch({this.description, this.placeId, this.mainText});

  factory PlaceSearch.fromJson(Map<String,dynamic> json){
    return PlaceSearch(
        description: json['description'],
        placeId: json['place_id'],
        mainText: json['structured_formatting']['main_text']
    );
  }
}