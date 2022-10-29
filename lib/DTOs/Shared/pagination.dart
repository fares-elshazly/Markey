class PaginationDTO {
  final int page;
  final int? perPage;

  PaginationDTO({required this.page, this.perPage});

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
      };
}
