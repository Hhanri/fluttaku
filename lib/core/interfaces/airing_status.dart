enum AiringStatus {
  completed,
  ongoing
}

AiringStatus parseAiringStatus(String value) {
  switch(value) {
    case "Completed": return AiringStatus.completed;
    case "Ongoing": return AiringStatus.ongoing;
    default: throw UnimplementedError("NO STATUS FOR VALUE $value");
  }
}