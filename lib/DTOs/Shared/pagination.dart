class PaginationDTO {
  final int? perPage;
  final int? currentPage;

  PaginationDTO({this.perPage, this.currentPage});

  Map<String, dynamic> toJson() => {
        "per_page": perPage,
        "current_page": currentPage,
      };
}
