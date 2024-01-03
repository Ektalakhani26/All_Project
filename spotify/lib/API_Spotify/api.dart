class Api {
  Api({
      this.albums,});

  Api.fromJson(dynamic json) {
    albums = json['albums'] != null ? Albums.fromJson(json['albums']) : null;
  }
  Albums? albums;
Api copyWith({  Albums? albums,
}) => Api(  albums: albums ?? this.albums,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (albums != null) {
      map['albums'] = albums?.toJson();
    }
    return map;
  }

}

class Albums {
  Albums({
      this.href, 
      this.limit, 
      this.next, 
      this.offset, 
      this.previous, 
      this.total, 
      this.items,});

  Albums.fromJson(dynamic json) {
    href = json['href'];
    limit = json['limit'];
    next = json['next'];
    offset = json['offset'];
    previous = json['previous'];
    total = json['total'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
  }
  String? href;
  num? limit;
  String? next;
  num? offset;
  String? previous;
  num? total;
  List<Items>? items;
Albums copyWith({  String? href,
  num? limit,
  String? next,
  num? offset,
  String? previous,
  num? total,
  List<Items>? items,
}) => Albums(  href: href ?? this.href,
  limit: limit ?? this.limit,
  next: next ?? this.next,
  offset: offset ?? this.offset,
  previous: previous ?? this.previous,
  total: total ?? this.total,
  items: items ?? this.items,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    map['limit'] = limit;
    map['next'] = next;
    map['offset'] = offset;
    map['previous'] = previous;
    map['total'] = total;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Items {
  Items({
      this.albumType, 
      this.totalTracks, 
      this.availableMarkets, 
      this.externalUrls, 
      this.href, 
      this.id, 
      this.images, 
      this.name, 
      this.releaseDate, 
      this.releaseDatePrecision, 
      this.restrictions, 
      this.type, 
      this.uri, 
      this.artists,});

  Items.fromJson(dynamic json) {
    albumType = json['album_type'];
    totalTracks = json['total_tracks'];
    availableMarkets = json['available_markets'] != null ? json['available_markets'].cast<String>() : [];
    externalUrls = json['external_urls'] != null ? ExternalUrls.fromJson(json['external_urls']) : null;
    href = json['href'];
    id = json['id'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
    name = json['name'];
    releaseDate = json['release_date'];
    releaseDatePrecision = json['release_date_precision'];
    restrictions = json['restrictions'] != null ? Restrictions.fromJson(json['restrictions']) : null;
    type = json['type'];
    uri = json['uri'];
    if (json['artists'] != null) {
      artists = [];
      json['artists'].forEach((v) {
        artists?.add(Artists.fromJson(v));
      });
    }
  }
  String? albumType;
  num? totalTracks;
  List<String>? availableMarkets;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Images>? images;
  String? name;
  String? releaseDate;
  String? releaseDatePrecision;
  Restrictions? restrictions;
  String? type;
  String? uri;
  List<Artists>? artists;
Items copyWith({  String? albumType,
  num? totalTracks,
  List<String>? availableMarkets,
  ExternalUrls? externalUrls,
  String? href,
  String? id,
  List<Images>? images,
  String? name,
  String? releaseDate,
  String? releaseDatePrecision,
  Restrictions? restrictions,
  String? type,
  String? uri,
  List<Artists>? artists,
}) => Items(  albumType: albumType ?? this.albumType,
  totalTracks: totalTracks ?? this.totalTracks,
  availableMarkets: availableMarkets ?? this.availableMarkets,
  externalUrls: externalUrls ?? this.externalUrls,
  href: href ?? this.href,
  id: id ?? this.id,
  images: images ?? this.images,
  name: name ?? this.name,
  releaseDate: releaseDate ?? this.releaseDate,
  releaseDatePrecision: releaseDatePrecision ?? this.releaseDatePrecision,
  restrictions: restrictions ?? this.restrictions,
  type: type ?? this.type,
  uri: uri ?? this.uri,
  artists: artists ?? this.artists,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['album_type'] = albumType;
    map['total_tracks'] = totalTracks;
    map['available_markets'] = availableMarkets;
    if (externalUrls != null) {
      map['external_urls'] = externalUrls?.toJson();
    }
    map['href'] = href;
    map['id'] = id;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    map['name'] = name;
    map['release_date'] = releaseDate;
    map['release_date_precision'] = releaseDatePrecision;
    if (restrictions != null) {
      map['restrictions'] = restrictions?.toJson();
    }
    map['type'] = type;
    map['uri'] = uri;
    if (artists != null) {
      map['artists'] = artists?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Artists {
  Artists({
      this.externalUrls, 
      this.href, 
      this.id, 
      this.name, 
      this.type, 
      this.uri,});

  Artists.fromJson(dynamic json) {
    externalUrls = json['external_urls'] != null ? ExternalUrls.fromJson(json['external_urls']) : null;
    href = json['href'];
    id = json['id'];
    name = json['name'];
    type = json['type'];
    uri = json['uri'];
  }
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? name;
  String? type;
  String? uri;
Artists copyWith({  ExternalUrls? externalUrls,
  String? href,
  String? id,
  String? name,
  String? type,
  String? uri,
}) => Artists(  externalUrls: externalUrls ?? this.externalUrls,
  href: href ?? this.href,
  id: id ?? this.id,
  name: name ?? this.name,
  type: type ?? this.type,
  uri: uri ?? this.uri,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (externalUrls != null) {
      map['external_urls'] = externalUrls?.toJson();
    }
    map['href'] = href;
    map['id'] = id;
    map['name'] = name;
    map['type'] = type;
    map['uri'] = uri;
    return map;
  }

}

class ExternalUrls {
  ExternalUrls({
      this.spotify,});

  ExternalUrls.fromJson(dynamic json) {
    spotify = json['spotify'];
  }
  String? spotify;
ExternalUrls copyWith({  String? spotify,
}) => ExternalUrls(  spotify: spotify ?? this.spotify,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['spotify'] = spotify;
    return map;
  }

}

class Restrictions {
  Restrictions({
      this.reason,});

  Restrictions.fromJson(dynamic json) {
    reason = json['reason'];
  }
  String? reason;
Restrictions copyWith({  String? reason,
}) => Restrictions(  reason: reason ?? this.reason,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reason'] = reason;
    return map;
  }

}

class Images {
  Images({
      this.url, 
      this.height, 
      this.width,});

  Images.fromJson(dynamic json) {
    url = json['url'];
    height = json['height'];
    width = json['width'];
  }
  String? url;
  num? height;
  num? width;
Images copyWith({  String? url,
  num? height,
  num? width,
}) => Images(  url: url ?? this.url,
  height: height ?? this.height,
  width: width ?? this.width,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['height'] = height;
    map['width'] = width;
    return map;
  }

}

class ExternalUrls1 {
  ExternalUrls1({
      this.spotify,});

  ExternalUrls1.fromJson(dynamic json) {
    spotify = json['spotify'];
  }
  String? spotify;
ExternalUrls copyWith({  String? spotify,
}) => ExternalUrls(  spotify: spotify ?? this.spotify,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['spotify'] = spotify;
    return map;
  }

}