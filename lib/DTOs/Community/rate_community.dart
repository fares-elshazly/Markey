class RateCommunityDTO {
  final int rate;
  final int communityId;

  RateCommunityDTO({
    required this.rate,
    required this.communityId,
  });

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "community_id": communityId,
      };
}
