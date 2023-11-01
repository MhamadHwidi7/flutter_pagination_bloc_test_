class PokemonEvolutionParams {
  final int limit;
  final int offset;

  PokemonEvolutionParams({required this.limit, required this.offset});
  Map<String, dynamic> toJson() => {'offset': offset, 'limit': limit};
}
