Map<String, int> getNextPageParams({
  required int currentSkip,
  required int limit,
  required int total,
}) {
  final nextSkip = currentSkip + limit;
  final hasMore = nextSkip < total;

  return {
    'skip': hasMore ? nextSkip : currentSkip,
    'limit': limit,
    'hasMore': hasMore ? 1 : 0,
  };
}
