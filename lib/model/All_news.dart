

import 'dart:convert';

Allnews allnewsFromJson(String str) => Allnews.fromJson(json.decode(str));



class Allnews {
    String? status;
    List<Source>? sources;

    Allnews({
        this.status,
        this.sources,
    });

    factory Allnews.fromJson(Map<String, dynamic> json) => Allnews(
        status: json["status"],
        sources: json["sources"] == null ? [] : List<Source>.from(json["sources"]!.map((x) => Source.fromJson(x))),
    );

 
}

class Source {
    String? id;
    String? name;
    String? description;
    String? url;
    String? category;
    String? language;
    String? country;

    Source({
        this.id,
        this.name,
        this.description,
        this.url,
        this.category,
        this.language,
        this.country,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        url: json["url"],
        category: json["category"],
        language: json["language"],
        country: json["country"],
    );

  
}
