class BecomeExpertDTO {
  final int serviceId;

  BecomeExpertDTO({required this.serviceId});

  Map<String, dynamic> toJson() => {'service_id': serviceId};
}
