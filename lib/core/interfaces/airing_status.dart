enum AiringStatus {
  completed,
  ongoing,
  upcoming
}

AiringStatus parseAiringStatus(String value) {
  switch(value) {
    case "Completed": return AiringStatus.completed;
    case "Ongoing": return AiringStatus.ongoing;
    case "Not yet aired": return AiringStatus.upcoming;
    default: throw UnimplementedError("NO STATUS FOR VALUE $value");
  }
}