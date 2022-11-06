class PaginationDTO {
  final int page;
  final int? perPage;

  PaginationDTO({this.page = 1, this.perPage});

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
      };
}
