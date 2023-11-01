class PokemonParams {
  final int offset;
  final int limit;

  PokemonParams({required this.offset, required this.limit});
  Map<String, dynamic> toJson() => {
        'offset': offset,
        'limit': limit,
      };
}
