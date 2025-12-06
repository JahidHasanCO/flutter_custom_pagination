Map<String, int>? getNextPageParams({
  required int currentSkip,
  required int limit,
  required int total,
}) {
  final nextSkip = currentSkip + limit;
  final hasMore = nextSkip < total;
  
  if (!hasMore) {
    return null;
  }
  
  return {
    'skip': nextSkip,
    'limit': limit,
  };
}