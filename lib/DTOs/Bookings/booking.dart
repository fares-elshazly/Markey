class BookingDTO {
  final int packageId;

  BookingDTO({required this.packageId});

  Map<String, dynamic> toJson() => {"package_id": packageId};
}
