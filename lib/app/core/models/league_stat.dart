class LeagueStat {
  TopPlayers topPlayers;

  LeagueStat({this.topPlayers});

  LeagueStat.fromJson(Map<String, dynamic> json) {
    topPlayers = json['topPlayers'] != null
        ? new TopPlayers.fromJson(json['topPlayers'])
        : null;
  }
}

class TopPlayers {
  List<Goals> goals;
  List<Assists> assists;
  List<Saves> saves;
  List<CleanSheet> cleanSheet;

  TopPlayers(
      {this.goals,
      this.assists,
      this.saves,
      this.cleanSheet});

  TopPlayers.fromJson(Map<String, dynamic> json) {
    if (json['goals'] != null) {
      goals = new List<Goals>();
      json['goals'].forEach((v) {
        goals.add(new Goals.fromJson(v));
      });
    }
    if (json['assists'] != null) {
      assists = new List<Assists>();
      json['assists'].forEach((v) {
        assists.add(new Assists.fromJson(v));
      });
    }
    if (json['saves'] != null) {
      saves = new List<Saves>();
      json['saves'].forEach((v) {
        saves.add(new Saves.fromJson(v));
      });
    }
    if (json['cleanSheet'] != null) {
      cleanSheet = new List<CleanSheet>();
      json['cleanSheet'].forEach((v) {
        cleanSheet.add(new CleanSheet.fromJson(v));
      });
    }
  }
}

class Goals{
  GoalStatistics statistics;
  bool playedEnough;
  Player player;
  Team team;

  Goals({this.statistics, this.playedEnough, this.player, this.team});

  Goals.fromJson(Map<String, dynamic> json) {
    statistics = json['statistics'] != null
        ? new GoalStatistics.fromJson(json['statistics'])
        : null;
    playedEnough = json['playedEnough'];
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
  }
}

class Assists{
  AssistStatistics statistics;
  bool playedEnough;
  Player player;
  Team team;

  Assists({this.statistics, this.playedEnough, this.player, this.team});

  Assists.fromJson(Map<String, dynamic> json) {
    statistics = json['statistics'] != null
        ? new AssistStatistics.fromJson(json['statistics'])
        : null;
    playedEnough = json['playedEnough'];
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
  }
}

class Saves{
  SavesStatistics statistics;
  bool playedEnough;
  Player player;
  Team team;

  Saves({this.statistics, this.playedEnough, this.player, this.team});

  Saves.fromJson(Map<String, dynamic> json) {
    statistics = json['statistics'] != null
        ? new SavesStatistics.fromJson(json['statistics'])
        : null;
    playedEnough = json['playedEnough'];
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
  }
}

class CleanSheet{
  CleanSheetStatistics statistics;
  bool playedEnough;
  Player player;
  Team team;

  CleanSheet({this.statistics, this.playedEnough, this.player, this.team});

  CleanSheet.fromJson(Map<String, dynamic> json) {
    statistics = json['statistics'] != null
        ? new CleanSheetStatistics.fromJson(json['statistics'])
        : null;
    playedEnough = json['playedEnough'];
    player =
        json['player'] != null ? new Player.fromJson(json['player']) : null;
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
  }
}

class GoalStatistics {
  int goals;
  int id;
  String type;
  int appearances;

  GoalStatistics({this.goals, this.id, this.type, this.appearances});

  GoalStatistics.fromJson(Map<String, dynamic> json) {
    goals = json['goals'];
    id = json['id'];
    type = json['type'];
    appearances = json['appearances'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goals'] = this.goals;
    data['id'] = this.id;
    data['type'] = this.type;
    data['appearances'] = this.appearances;
    return data;
  }
}

class AssistStatistics {
  int assists;
  int id;
  String type;
  int appearances;

  AssistStatistics({this.assists, this.id, this.type, this.appearances});

  AssistStatistics.fromJson(Map<String, dynamic> json) {
    assists = json['assists'];
    id = json['id'];
    type = json['type'];
    appearances = json['appearances'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assists'] = this.assists;
    data['id'] = this.id;
    data['type'] = this.type;
    data['appearances'] = this.appearances;
    return data;
  }
}

class SavesStatistics {
  int saves;
  int id;
  String type;
  int appearances;

  SavesStatistics({this.saves, this.id, this.type, this.appearances});

  SavesStatistics.fromJson(Map<String, dynamic> json) {
    saves = json['saves'];
    id = json['id'];
    type = json['type'];
    appearances = json['appearances'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['saves'] = this.saves;
    data['id'] = this.id;
    data['type'] = this.type;
    data['appearances'] = this.appearances;
    return data;
  }
}

class CleanSheetStatistics {
  int cleanSheet;
  int id;
  String type;
  int appearances;

  CleanSheetStatistics({this.cleanSheet, this.id, this.type, this.appearances});

  CleanSheetStatistics.fromJson(Map<String, dynamic> json) {
    cleanSheet = json['cleanSheet'];
    id = json['id'];
    type = json['type'];
    appearances = json['appearances'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cleanSheet'] = this.cleanSheet;
    data['id'] = this.id;
    data['type'] = this.type;
    data['appearances'] = this.appearances;
    return data;
  }
}

class Player {
  String name;
  String slug;
  String shortName;
  String position;
  int userCount;
  int id;

  Player(
      {this.name,
      this.slug,
      this.shortName,
      this.position,
      this.userCount,
      this.id});

  Player.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    shortName = json['shortName'];
    position = json['position'];
    userCount = json['userCount'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['shortName'] = this.shortName;
    data['position'] = this.position;
    data['userCount'] = this.userCount;
    data['id'] = this.id;
    return data;
  }
}

class Team {
  String name;
  String slug;
  String shortName;
  int userCount;
  int type;
  int id;
  TeamColors teamColors;

  Team(
      {this.name,
      this.slug,
      this.shortName,
      this.userCount,
      this.type,
      this.id,
      this.teamColors});

  Team.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    shortName = json['shortName'];
    userCount = json['userCount'];
    type = json['type'];
    id = json['id'];
    teamColors = json['teamColors'] != null
        ? new TeamColors.fromJson(json['teamColors'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['shortName'] = this.shortName;
    data['userCount'] = this.userCount;
    data['type'] = this.type;
    data['id'] = this.id;
    if (this.teamColors != null) {
      data['teamColors'] = this.teamColors.toJson();
    }
    return data;
  }
}

class TeamColors {
  String primary;
  String secondary;
  String text;

  TeamColors({this.primary, this.secondary, this.text});

  TeamColors.fromJson(Map<String, dynamic> json) {
    primary = json['primary'];
    secondary = json['secondary'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primary'] = this.primary;
    data['secondary'] = this.secondary;
    data['text'] = this.text;
    return data;
  }
}


