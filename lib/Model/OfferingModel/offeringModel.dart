// To parse this JSON data, do
//
//     final offeringModel = offeringModelFromJson(jsonString);

import 'dart:convert';

OfferingModel offeringModelFromJson(String str) =>
    OfferingModel.fromJson(json.decode(str));

String offeringModelToJson(OfferingModel data) => json.encode(data.toJson());

class OfferingModel {
  List<OfferingModelList> offeringModelList;
  OfferingModelLinks? links;
  Meta? meta;
  bool? success;
  Included? included;

  OfferingModel({
    this.offeringModelList = const [],
    this.links,
    this.meta,
    this.success,
    this.included,
  });

  factory OfferingModel.fromJson(Map<String, dynamic> json) => OfferingModel(
        offeringModelList: json["data"] == null
            ? []
            : List<OfferingModelList>.from(
                json["data"]!.map((x) => OfferingModelList.fromJson(x))),
        links: json["links"] == null
            ? null
            : OfferingModelLinks.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        success: json["success"],
        included: json["included"] == null
            ? null
            : Included.fromJson(json["included"]),
      );

  Map<String, dynamic> toJson() => {
        "data": offeringModelList == null
            ? []
            : List<dynamic>.from(offeringModelList!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
        "success": success,
        "included": included?.toJson(),
      };
}

class OfferingModelList {
  String? type;
  int? id;
  Attributes? attributes;
  Relationships? relationships;
  DatumLinks? links;

  OfferingModelList({
    this.type,
    this.id,
    this.attributes,
    this.relationships,
    this.links,
  });

  factory OfferingModelList.fromJson(Map<String, dynamic> json) =>
      OfferingModelList(
        type: json["type"],
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : Attributes.fromJson(json["attributes"]),
        relationships: json["relationships"] == null
            ? null
            : Relationships.fromJson(json["relationships"]),
        links:
            json["links"] == null ? null : DatumLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "attributes": attributes?.toJson(),
        "relationships": relationships?.toJson(),
        "links": links?.toJson(),
      };
}

class Attributes {
  int? id;
  String? slug;
  int? userId;
  int? organizationId;
  String? name;
  String? shortDescription;
  String? fullDescription;
  String? status;
  String? statusTitle;
  dynamic term;
  int? interestRate;
  String? capitalType;
  dynamic investmentType;
  double? raisedAmountPercent;
  String? openDate;
  String? closeDate;
  String? creditScore;
  String? creditScoreTitle;
  String? seoTitle;
  String? seoDescription;
  int? lastUnitValuation;
  int? numberOfShares;
  int? minCommitmentShares;
  int? maxCommitmentShares;
  HeroImage? heroImage;
  DebitedPayoutsAmount? raisedAmount;
  DebitedPayoutsAmount? fundingGoal;
  dynamic minCommitment;
  dynamic maxCommitment;
  dynamic maxOverfundingAmount;
  String? fundingGoalFormatted;
  String? capitalTypeTitle;
  String? raisedAmountFormatted;
  dynamic minCommitmentFormatted;
  dynamic maxCommitmentFormatted;
  dynamic maxOverfundingAmountFormatted;
  String? isaEnabledAt;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  DebitedPayoutsAmount? pendingPayoutsAmount;
  DebitedPayoutsAmount? debitedPayoutsAmount;
  DebitedPayoutsAmount? raisedAmountWithPending;
  String? raisedAmountWithPendingFormatted;
  double? raisedAmountWithPendingPercent;
  SocialLinks? socialLinks;
  List<dynamic>? tags;
  List<dynamic>? customAttributes;
  DebitedPayoutsAmount? pricePerShare;
  String? pricePerShareFormatted;
  String? offeringAgreementName;

  Attributes({
    this.id,
    this.slug,
    this.userId,
    this.organizationId,
    this.name,
    this.shortDescription,
    this.fullDescription,
    this.status,
    this.statusTitle,
    this.term,
    this.interestRate,
    this.capitalType,
    this.investmentType,
    this.raisedAmountPercent,
    this.openDate,
    this.closeDate,
    this.creditScore,
    this.creditScoreTitle,
    this.seoTitle,
    this.seoDescription,
    this.lastUnitValuation,
    this.numberOfShares,
    this.minCommitmentShares,
    this.maxCommitmentShares,
    this.heroImage,
    this.raisedAmount,
    this.fundingGoal,
    this.minCommitment,
    this.maxCommitment,
    this.maxOverfundingAmount,
    this.fundingGoalFormatted,
    this.capitalTypeTitle,
    this.raisedAmountFormatted,
    this.minCommitmentFormatted,
    this.maxCommitmentFormatted,
    this.maxOverfundingAmountFormatted,
    this.isaEnabledAt,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.pendingPayoutsAmount,
    this.debitedPayoutsAmount,
    this.raisedAmountWithPending,
    this.raisedAmountWithPendingFormatted,
    this.raisedAmountWithPendingPercent,
    this.socialLinks,
    this.tags,
    this.customAttributes,
    this.pricePerShare,
    this.pricePerShareFormatted,
    this.offeringAgreementName,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        id: json["id"],
        slug: json["slug"],
        userId: json["user_id"],
        organizationId: json["organization_id"],
        name: json["name"],
        shortDescription: json["short_description"],
        fullDescription: json["full_description"],
        status: json["status"],
        statusTitle: json["status_title"],
        term: json["term"],
        interestRate: json["interest_rate"],
        capitalType: json["capital_type"],
        investmentType: json["investment_type"],
        raisedAmountPercent: json["raised_amount_percent"]?.toDouble(),
        openDate: json["open_date"],
        closeDate: json["close_date"],
        creditScore: json["credit_score"],
        creditScoreTitle: json["credit_score_title"],
        seoTitle: json["seo_title"],
        seoDescription: json["seo_description"],
        lastUnitValuation: json["last_unit_valuation"],
        numberOfShares: json["number_of_shares"],
        minCommitmentShares: json["min_commitment_shares"],
        maxCommitmentShares: json["max_commitment_shares"],
        heroImage: json["hero_image"] == null
            ? null
            : HeroImage.fromJson(json["hero_image"]),
        raisedAmount: json["raised_amount"] == null
            ? null
            : DebitedPayoutsAmount.fromJson(json["raised_amount"]),
        fundingGoal: json["funding_goal"] == null
            ? null
            : DebitedPayoutsAmount.fromJson(json["funding_goal"]),
        minCommitment: json["min_commitment"],
        maxCommitment: json["max_commitment"],
        maxOverfundingAmount: json["max_overfunding_amount"],
        fundingGoalFormatted: json["funding_goal_formatted"],
        capitalTypeTitle: json["capital_type_title"],
        raisedAmountFormatted: json["raised_amount_formatted"],
        minCommitmentFormatted: json["min_commitment_formatted"],
        maxCommitmentFormatted: json["max_commitment_formatted"],
        maxOverfundingAmountFormatted: json["max_overfunding_amount_formatted"],
        isaEnabledAt: json["isa_enabled_at"],
        publishedAt: json["published_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        pendingPayoutsAmount: json["pending_payouts_amount"] == null
            ? null
            : DebitedPayoutsAmount.fromJson(json["pending_payouts_amount"]),
        debitedPayoutsAmount: json["debited_payouts_amount"] == null
            ? null
            : DebitedPayoutsAmount.fromJson(json["debited_payouts_amount"]),
        raisedAmountWithPending: json["raised_amount_with_pending"] == null
            ? null
            : DebitedPayoutsAmount.fromJson(json["raised_amount_with_pending"]),
        raisedAmountWithPendingFormatted:
            json["raised_amount_with_pending_formatted"],
        raisedAmountWithPendingPercent:
            json["raised_amount_with_pending_percent"]?.toDouble(),
        socialLinks: json["social_links"] == null
            ? null
            : SocialLinks.fromJson(json["social_links"]),
        tags: json["tags"] == null
            ? []
            : List<dynamic>.from(json["tags"]!.map((x) => x)),
        customAttributes: json["custom_attributes"] == null
            ? []
            : List<dynamic>.from(json["custom_attributes"]!.map((x) => x)),
        pricePerShare: json["price_per_share"] == null
            ? null
            : DebitedPayoutsAmount.fromJson(json["price_per_share"]),
        pricePerShareFormatted: json["price_per_share_formatted"],
        offeringAgreementName: json["offering_agreement_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "user_id": userId,
        "organization_id": organizationId,
        "name": name,
        "short_description": shortDescription,
        "full_description": fullDescription,
        "status": status,
        "status_title": statusTitle,
        "term": term,
        "interest_rate": interestRate,
        "capital_type": capitalType,
        "investment_type": investmentType,
        "raised_amount_percent": raisedAmountPercent,
        "open_date": openDate,
        "close_date": closeDate,
        "credit_score": creditScore,
        "credit_score_title": creditScoreTitle,
        "seo_title": seoTitle,
        "seo_description": seoDescription,
        "last_unit_valuation": lastUnitValuation,
        "number_of_shares": numberOfShares,
        "min_commitment_shares": minCommitmentShares,
        "max_commitment_shares": maxCommitmentShares,
        "hero_image": heroImage?.toJson(),
        "raised_amount": raisedAmount?.toJson(),
        "funding_goal": fundingGoal?.toJson(),
        "min_commitment": minCommitment,
        "max_commitment": maxCommitment,
        "max_overfunding_amount": maxOverfundingAmount,
        "funding_goal_formatted": fundingGoalFormatted,
        "capital_type_title": capitalTypeTitle,
        "raised_amount_formatted": raisedAmountFormatted,
        "min_commitment_formatted": minCommitmentFormatted,
        "max_commitment_formatted": maxCommitmentFormatted,
        "max_overfunding_amount_formatted": maxOverfundingAmountFormatted,
        "isa_enabled_at": isaEnabledAt,
        "published_at": publishedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "pending_payouts_amount": pendingPayoutsAmount?.toJson(),
        "debited_payouts_amount": debitedPayoutsAmount?.toJson(),
        "raised_amount_with_pending": raisedAmountWithPending?.toJson(),
        "raised_amount_with_pending_formatted":
            raisedAmountWithPendingFormatted,
        "raised_amount_with_pending_percent": raisedAmountWithPendingPercent,
        "social_links": socialLinks?.toJson(),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "custom_attributes": customAttributes == null
            ? []
            : List<dynamic>.from(customAttributes!.map((x) => x)),
        "price_per_share": pricePerShare?.toJson(),
        "price_per_share_formatted": pricePerShareFormatted,
        "offering_agreement_name": offeringAgreementName,
      };
}

class DebitedPayoutsAmount {
  int? subUnits;
  String? currency;
  String? formatted;
  int? monetary;

  DebitedPayoutsAmount({
    this.subUnits,
    this.currency,
    this.formatted,
    this.monetary,
  });

  factory DebitedPayoutsAmount.fromJson(Map<String, dynamic> json) =>
      DebitedPayoutsAmount(
        subUnits: json["sub_units"],
        currency: json["currency"],
        formatted: json["formatted"],
        monetary: json["monetary"],
      );

  Map<String, dynamic> toJson() => {
        "sub_units": subUnits,
        "currency": currency,
        "formatted": formatted,
        "monetary": monetary,
      };
}

class HeroImage {
  String? uuid;
  String? collectionName;
  String? name;
  String? originFileName;
  String? originalUrl;
  String? mimeType;
  int? size;
  CustomProperties? customProperties;
  int? orderColumn;
  String? subsystem;
  int? createdBy;
  Conversions? conversions;
  ResponsiveImages? responsiveImages;
  String? visibility;
  String? responsiveImagesBaseUrl;
  String? createdAt;
  String? updatedAt;

  HeroImage({
    this.uuid,
    this.collectionName,
    this.name,
    this.originFileName,
    this.originalUrl,
    this.mimeType,
    this.size,
    this.customProperties,
    this.orderColumn,
    this.subsystem,
    this.createdBy,
    this.conversions,
    this.responsiveImages,
    this.visibility,
    this.responsiveImagesBaseUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory HeroImage.fromJson(Map<String, dynamic> json) => HeroImage(
        uuid: json["uuid"],
        collectionName: json["collection_name"],
        name: json["name"],
        originFileName: json["origin_file_name"],
        originalUrl: json["original_url"],
        mimeType: json["mime_type"],
        size: json["size"],
        customProperties: json["custom_properties"] == null
            ? null
            : CustomProperties.fromJson(json["custom_properties"]),
        orderColumn: json["order_column"],
        subsystem: json["subsystem"],
        createdBy: json["created_by"],
        conversions: json["conversions"] == null
            ? null
            : Conversions.fromJson(json["conversions"]),
        responsiveImages: json["responsive_images"] == null
            ? null
            : ResponsiveImages.fromJson(json["responsive_images"]),
        visibility: json["visibility"],
        responsiveImagesBaseUrl: json["responsive_images_base_url"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "collection_name": collectionName,
        "name": name,
        "origin_file_name": originFileName,
        "original_url": originalUrl,
        "mime_type": mimeType,
        "size": size,
        "custom_properties": customProperties?.toJson(),
        "order_column": orderColumn,
        "subsystem": subsystem,
        "created_by": createdBy,
        "conversions": conversions?.toJson(),
        "responsive_images": responsiveImages?.toJson(),
        "visibility": visibility,
        "responsive_images_base_url": responsiveImagesBaseUrl,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Conversions {
  String? hd;
  String? thumb;
  String? thumbLg;
  String? thumbSm;
  String? backoffice;

  Conversions({
    this.hd,
    this.thumb,
    this.thumbLg,
    this.thumbSm,
    this.backoffice,
  });

  factory Conversions.fromJson(Map<String, dynamic> json) => Conversions(
        hd: json["hd"],
        thumb: json["thumb"],
        thumbLg: json["thumb_lg"],
        thumbSm: json["thumb_sm"],
        backoffice: json["backoffice"],
      );

  Map<String, dynamic> toJson() => {
        "hd": hd,
        "thumb": thumb,
        "thumb_lg": thumbLg,
        "thumb_sm": thumbSm,
        "backoffice": backoffice,
      };
}

class CustomProperties {
  String? description;

  CustomProperties({
    this.description,
  });

  factory CustomProperties.fromJson(Map<String, dynamic> json) =>
      CustomProperties(
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
      };
}

class ResponsiveImages {
  Hd? hd;

  ResponsiveImages({
    this.hd,
  });

  factory ResponsiveImages.fromJson(Map<String, dynamic> json) =>
      ResponsiveImages(
        hd: json["hd"] == null ? null : Hd.fromJson(json["hd"]),
      );

  Map<String, dynamic> toJson() => {
        "hd": hd?.toJson(),
      };
}

class Hd {
  List<String>? urls;
  List<Breakpoint>? breakpoints;

  Hd({
    this.urls,
    this.breakpoints,
  });

  factory Hd.fromJson(Map<String, dynamic> json) => Hd(
        urls: json["urls"] == null
            ? []
            : List<String>.from(json["urls"]!.map((x) => x)),
        breakpoints: json["breakpoints"] == null
            ? []
            : List<Breakpoint>.from(
                json["breakpoints"]!.map((x) => Breakpoint.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "urls": urls == null ? [] : List<dynamic>.from(urls!.map((x) => x)),
        "breakpoints": breakpoints == null
            ? []
            : List<dynamic>.from(breakpoints!.map((x) => x.toJson())),
      };
}

class Breakpoint {
  int? width;
  int? height;
  String? filename;
  int? fitWidth;
  int? fitHeight;
  String? mediaQuery;

  Breakpoint({
    this.width,
    this.height,
    this.filename,
    this.fitWidth,
    this.fitHeight,
    this.mediaQuery,
  });

  factory Breakpoint.fromJson(Map<String, dynamic> json) => Breakpoint(
        width: json["width"],
        height: json["height"],
        filename: json["filename"],
        fitWidth: json["fit_width"],
        fitHeight: json["fit_height"],
        mediaQuery: json["media_query"],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "filename": filename,
        "fit_width": fitWidth,
        "fit_height": fitHeight,
        "media_query": mediaQuery,
      };
}

class SocialLinks {
  dynamic facebook;
  dynamic linkedin;
  dynamic twitter;

  SocialLinks({
    this.facebook,
    this.linkedin,
    this.twitter,
  });

  factory SocialLinks.fromJson(Map<String, dynamic> json) => SocialLinks(
        facebook: json["facebook"],
        linkedin: json["linkedin"],
        twitter: json["twitter"],
      );

  Map<String, dynamic> toJson() => {
        "facebook": facebook,
        "linkedin": linkedin,
        "twitter": twitter,
      };
}

class DatumLinks {
  String? self;

  DatumLinks({
    this.self,
  });

  factory DatumLinks.fromJson(Map<String, dynamic> json) => DatumLinks(
        self: json["self"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
      };
}

class Relationships {
  List<dynamic>? addresses;
  Organization? user;
  Organization? organization;
  List<OfferingAgreement>? offeringAgreements;

  Relationships({
    this.addresses,
    this.user,
    this.organization,
    this.offeringAgreements,
  });

  factory Relationships.fromJson(Map<String, dynamic> json) => Relationships(
        addresses: json["addresses"] == null
            ? []
            : List<dynamic>.from(json["addresses"]!.map((x) => x)),
        user: json["user"] == null ? null : Organization.fromJson(json["user"]),
        organization: json["organization"] == null
            ? null
            : Organization.fromJson(json["organization"]),
        offeringAgreements: json["offering_agreements"] == null
            ? []
            : List<OfferingAgreement>.from(json["offering_agreements"]!
                .map((x) => OfferingAgreement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "addresses": addresses == null
            ? []
            : List<dynamic>.from(addresses!.map((x) => x)),
        "user": user?.toJson(),
        "organization": organization?.toJson(),
        "offering_agreements": offeringAgreements == null
            ? []
            : List<dynamic>.from(offeringAgreements!.map((x) => x.toJson())),
      };
}

class OfferingAgreement {
  String? type;
  int? id;

  OfferingAgreement({
    this.type,
    this.id,
  });

  factory OfferingAgreement.fromJson(Map<String, dynamic> json) =>
      OfferingAgreement(
        type: json["type"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
      };
}

class Organization {
  DatumLinks? links;
  OfferingAgreement? data;

  Organization({
    this.links,
    this.data,
  });

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
        links:
            json["links"] == null ? null : DatumLinks.fromJson(json["links"]),
        data: json["data"] == null
            ? null
            : OfferingAgreement.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "links": links?.toJson(),
        "data": data?.toJson(),
      };
}

class Included {
  Included();

  factory Included.fromJson(Map<String, dynamic> json) => Included();

  Map<String, dynamic> toJson() => {};
}

class OfferingModelLinks {
  String? first;
  String? last;
  dynamic prev;
  String? next;

  OfferingModelLinks({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory OfferingModelLinks.fromJson(Map<String, dynamic> json) =>
      OfferingModelLinks(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
