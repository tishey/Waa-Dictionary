// To parse this JSON data, do
//
//     final dictionary = dictionaryFromJson(jsonString);

import 'dart:convert';

List<Dictionary> dictionaryFromJson(dynamic str) => List<Dictionary>.from(json.decode(str).map((x) => Dictionary.fromJson(x)));

String dictionaryToJson(List<Dictionary> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Dictionary {
    Dictionary({
        required this.word,
        required this.phonetics,
        required this.meanings,
        required this.license,
        required this.sourceUrls,
    });

    String word;
    List<Phonetic> phonetics;
    List<Meaning> meanings;
    License license;
    List<String> sourceUrls;

    factory Dictionary.fromJson(Map<String, dynamic> json) => Dictionary(
        word: json["word"],
        phonetics: List<Phonetic>.from(json["phonetics"].map((x) => Phonetic.fromJson(x))),
        meanings: List<Meaning>.from(json["meanings"].map((x) => Meaning.fromJson(x))),
        license: License.fromJson(json["license"]),
        sourceUrls: List<String>.from(json["sourceUrls"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "word": word,
        "phonetics": List<dynamic>.from(phonetics.map((x) => x.toJson())),
        "meanings": List<dynamic>.from(meanings.map((x) => x.toJson())),
        "license": license.toJson(),
        "sourceUrls": List<dynamic>.from(sourceUrls.map((x) => x)),
    };
}

class License {
    License({
        required this.name,
        required this.url,
    });

    String name;
    String url;

    factory License.fromJson(Map<String, dynamic> json) => License(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

class Meaning {
    Meaning({
        required this.partOfSpeech,
        required this.definitions,
        required this.synonyms,
        required this.antonyms,
    });

    String partOfSpeech;
    List<Definition> definitions;
    List<String> synonyms;
    List<String> antonyms;

    factory Meaning.fromJson(Map<String, dynamic> json) => Meaning(
        partOfSpeech: json["partOfSpeech"],
        definitions: List<Definition>.from(json["definitions"].map((x) => Definition.fromJson(x))),
        synonyms: List<String>.from(json["synonyms"].map((x) => x)),
        antonyms: List<String>.from(json["antonyms"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "partOfSpeech": partOfSpeech,
        "definitions": List<dynamic>.from(definitions.map((x) => x.toJson())),
        "synonyms": List<dynamic>.from(synonyms.map((x) => x)),
        "antonyms": List<dynamic>.from(antonyms.map((x) => x)),
    };
}

class Definition {
    Definition({
        required this.definition,
        required this.synonyms,
        required this.antonyms,
        this.example,
    });

    String definition;
    List<dynamic> synonyms;
    List<dynamic> antonyms;
    String? example;

    factory Definition.fromJson(Map<String, dynamic> json) => Definition(
        definition: json["definition"],
        synonyms: List<dynamic>.from(json["synonyms"].map((x) => x)),
        antonyms: List<dynamic>.from(json["antonyms"].map((x) => x)),
        example: json["example"],
    );

    Map<String, dynamic> toJson() => {
        "definition": definition,
        "synonyms": List<dynamic>.from(synonyms.map((x) => x)),
        "antonyms": List<dynamic>.from(antonyms.map((x) => x)),
        "example": example,
    };
}

class Phonetic {
    Phonetic({
        required this.audio,
        this.sourceUrl,
        this.license,
        this.text,
    });

    String audio;
    String? sourceUrl;
    License? license;
    String? text;

    factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
        audio: json["audio"],
        sourceUrl: json["sourceUrl"],
        license: json["license"] == null ? null : License.fromJson(json["license"]),
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "audio": audio,
        "sourceUrl": sourceUrl,
        "license": license?.toJson(),
        "text": text,
    };
}





class DictionWord {
  String title;
  String subtitle;
  String meaning;

  DictionWord({required this.title, required this.subtitle, required this.meaning});


  static List<DictionWord> getWord(){
    return [
      DictionWord(
        title: 'Hello',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'Greetings',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
        
      ),
      DictionWord(
        title: 'New',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'Word',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'Guesture',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'Detetector',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'Get',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'It',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled'
      ),
      DictionWord(
        title: 'Flabagasted',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'Require',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'Need',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'Detetector',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'Get',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'It',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'Flabagasted',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'Require',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'Need',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'Detetector',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'Get',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'It',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'Flabagasted',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'Require',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
      DictionWord(
        title: 'Need',
        subtitle: 'Lorem Ipsum, The input method toggled cursor monitoring on',
        meaning: 'Lorem Ipsum, The input method toggled cursor monitoring on, orem Ipsum, The input method toggled cursor monitoring'
      ),
    ];
  }
}





