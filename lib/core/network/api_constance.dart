class ApiConstance {
  static const baseUrl = "https://phone-specs-api-azharimm.vercel.app";

  static const latestDevicesPath = "$baseUrl/latest/";
  static const brandsPath = "$baseUrl/brands/";
  static const topByInterestDevicesPath = "$baseUrl/top-by-interest/";
  static const topByFansDevicesPath = "$baseUrl/top-by-fans/";

  static brandDevicesPath(brandSlug) => '$baseUrl/brands/$brandSlug';

  static deviceSpecPath(slug) => "$baseUrl/$slug";

  static deviceThumbnailPath(slug) => "$baseUrl/$slug";

  static searchResultPath(query) => "$baseUrl/search?query=$query";
}