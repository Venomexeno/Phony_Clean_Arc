class ApiConstance {
  static const baseUrl = "https://phone-specs-api.azharimm.dev/v2";
  static const latestDevicesPath = "$baseUrl/latest/";

  static const brandsPath = "$baseUrl/brands/";
  static const searchDevicesPath = "$baseUrl/search/?query=";
  static const topByInterestDevicesPath = "$baseUrl/top-by-interest/";
  static const topByFansDevicesPath = "$baseUrl/top-by-fans/";

  static deviceSpecPath(slug) => "$baseUrl/$slug";

  static deviceThumbnailPath(slug) => "$baseUrl/$slug";
}
