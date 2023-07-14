enum AiringStatus {
  completed,
  ongoing,
  upcoming
}

AiringStatus parseAiringStatus(String value) {
  switch(value) {
    case "Completed": return AiringStatus.completed;
    case "Ongoing": return AiringStatus.ongoing;
    case "Not aired yet": return AiringStatus.upcoming;
    default: throw UnimplementedError("NO STATUS FOR VALUE $value");
  }
}