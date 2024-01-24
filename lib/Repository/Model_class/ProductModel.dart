class ProductModel {
  ProductModel({
      this.status, 
      this.requestId, 
      this.data,});

  ProductModel.fromJson(dynamic json) {
    status = json['status'];
    requestId = json['request_id'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? status;
  String? requestId;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['request_id'] = requestId;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.productId, 
      this.productTitle, 
      this.productDescription, 
      this.productPhotos, 
      this.productAttributes, 
      this.productRating, 
      this.productPageUrl, 
      this.productOffersPageUrl, 
      this.productSpecsPageUrl, 
      this.productReviewsPageUrl, 
      this.productNumReviews, 
      this.productNumOffers, 
      this.typicalPriceRange, 
      this.offer,});

  Data.fromJson(dynamic json) {
    productId = json['product_id'];
    productTitle = json['product_title'];
    productDescription = json['product_description'];
    productPhotos = json['product_photos'] != null ? json['product_photos'].cast<String>() : [];
    productAttributes = json['product_attributes'] != null ? ProductAttributes.fromJson(json['product_attributes']) : null;
    productRating = json['product_rating'];
    productPageUrl = json['product_page_url'];
    productOffersPageUrl = json['product_offers_page_url'];
    productSpecsPageUrl = json['product_specs_page_url'];
    productReviewsPageUrl = json['product_reviews_page_url'];
    productNumReviews = json['product_num_reviews'];
    productNumOffers = json['product_num_offers'];
    typicalPriceRange = json['typical_price_range'] != null ? json['typical_price_range'].cast<String>() : [];
    offer = json['offer'] != null ? Offer.fromJson(json['offer']) : null;
  }
  String? productId;
  String? productTitle;
  String? productDescription;
  List<String>? productPhotos;
  ProductAttributes? productAttributes;
  dynamic productRating;
  String? productPageUrl;
  String? productOffersPageUrl;
  String? productSpecsPageUrl;
  String? productReviewsPageUrl;
  dynamic productNumReviews;
  String? productNumOffers;
  List<String>? typicalPriceRange;
  Offer? offer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = productId;
    map['product_title'] = productTitle;
    map['product_description'] = productDescription;
    map['product_photos'] = productPhotos;
    if (productAttributes != null) {
      map['product_attributes'] = productAttributes?.toJson();
    }
    map['product_rating'] = productRating;
    map['product_page_url'] = productPageUrl;
    map['product_offers_page_url'] = productOffersPageUrl;
    map['product_specs_page_url'] = productSpecsPageUrl;
    map['product_reviews_page_url'] = productReviewsPageUrl;
    map['product_num_reviews'] = productNumReviews;
    map['product_num_offers'] = productNumOffers;
    map['typical_price_range'] = typicalPriceRange;
    if (offer != null) {
      map['offer'] = offer?.toJson();
    }
    return map;
  }

}

class Offer {
  Offer({
      this.storeName, 
      this.storeRating, 
      this.offerPageUrl, 
      this.storeReviewCount, 
      this.storeReviewsPageUrl, 
      this.price, 
      this.shipping, 
      this.tax, 
      this.onSale, 
      this.originalPrice, 
      this.productCondition,});

  Offer.fromJson(dynamic json) {
    storeName = json['store_name'];
    storeRating = json['store_rating'];
    offerPageUrl = json['offer_page_url'];
    storeReviewCount = json['store_review_count'];
    storeReviewsPageUrl = json['store_reviews_page_url'];
    price = json['price'];
    shipping = json['shipping'];
    tax = json['tax'];
    onSale = json['on_sale'];
    originalPrice = json['original_price'];
    productCondition = json['product_condition'];
  }
  String? storeName;
  dynamic storeRating;
  String? offerPageUrl;
  dynamic storeReviewCount;
  String? storeReviewsPageUrl;
  String? price;
  String? shipping;
  String? tax;
  bool? onSale;
  dynamic originalPrice;
  String? productCondition;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['store_name'] = storeName;
    map['store_rating'] = storeRating;
    map['offer_page_url'] = offerPageUrl;
    map['store_review_count'] = storeReviewCount;
    map['store_reviews_page_url'] = storeReviewsPageUrl;
    map['price'] = price;
    map['shipping'] = shipping;
    map['tax'] = tax;
    map['on_sale'] = onSale;
    map['original_price'] = originalPrice;
    map['product_condition'] = productCondition;
    return map;
  }

}

class ProductAttributes {
  ProductAttributes({
      this.department, 
      this.size, 
      this.material, 
      this.closureStyle, 
      this.style,});

  ProductAttributes.fromJson(dynamic json) {
    department = json['Department'];
    size = json['Size'];
    material = json['Material'];
    closureStyle = json['Closure Style'];
    style = json['Style'];
  }
  String? department;
  String? size;
  String? material;
  String? closureStyle;
  String? style;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Department'] = department;
    map['Size'] = size;
    map['Material'] = material;
    map['Closure Style'] = closureStyle;
    map['Style'] = style;
    return map;
  }

}