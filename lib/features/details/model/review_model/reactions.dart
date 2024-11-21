class Reactions {
  int? overall;
  int? nice;
  int? loveIt;
  int? funny;
  int? confusing;
  int? informative;
  int? wellWritten;
  int? creative;

  Reactions({
    this.overall,
    this.nice,
    this.loveIt,
    this.funny,
    this.confusing,
    this.informative,
    this.wellWritten,
    this.creative,
  });

  factory Reactions.fromJson(Map<String, dynamic> json) => Reactions(
        overall: json['overall'] as int?,
        nice: json['nice'] as int?,
        loveIt: json['love_it'] as int?,
        funny: json['funny'] as int?,
        confusing: json['confusing'] as int?,
        informative: json['informative'] as int?,
        wellWritten: json['well_written'] as int?,
        creative: json['creative'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'overall': overall,
        'nice': nice,
        'love_it': loveIt,
        'funny': funny,
        'confusing': confusing,
        'informative': informative,
        'well_written': wellWritten,
        'creative': creative,
      };
}
