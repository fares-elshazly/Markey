class GetExpertsDTO {
  final List<int> servicesIds;

  GetExpertsDTO({required this.servicesIds});

  String toQuery() => servicesIds.join(',');
}
