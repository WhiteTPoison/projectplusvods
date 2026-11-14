
DROP TABLE IF EXISTS game_character;
DROP TABLE IF EXISTS game;
DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS mod;
DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS vod;
DROP TABLE IF EXISTS submission;
DROP TABLE IF EXISTS metadata;

CREATE TABLE mod (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE game (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE game_character (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  game_id INTEGER NOT NULL,
  name TEXT NOT NULL,
  icon_url TEXT,
  FOREIGN KEY (game_id) REFERENCES game (id)
);

CREATE TABLE player (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tag TEXT NOT NULL
);

CREATE TABLE submission (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    url TEXT NOT NULL,
    status INTEGER NOT NULL,
    game_id INTEGER NOT NULL,
    p1 TEXT,
    c1 TEXT,
    p2 TEXT,
    c2 TEXT,
    p3 TEXT,
    c3 TEXT,
    p4 TEXT,
    c4 TEXT,
    round TEXT,
    event TEXT,
    date TEXT,
    FOREIGN KEY (game_id) REFERENCES game (id)
);

CREATE TABLE event (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    vods_url TEXT
);

CREATE TABLE vod (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  game_id INTEGER NOT NULL,
  event_id INTEGER NOT NULL,
  url TEXT NOT NULL,
  p1_id INTEGER NOT NULL,
  c1_id INTEGER NOT NULL,
  p2_id INTEGER NOT NULL,
  c2_id INTEGER NOT NULL,
  p3_id INTEGER,
  c3_id INTEGER,
  p4_id INTEGER,
  c4_id INTEGER,
  -- Characters after the first, when a player used several ("Falco, Fox" on the sheet): comma-separated
  -- game_character IDs in the order listed, e.g. "8" or "8,22". NULL when they used one character.
  c1_extra_ids TEXT,
  c2_extra_ids TEXT,
  submission_id INTEGER,
  vod_date TIMESTAMP,
  round TEXT,
  FOREIGN KEY (game_id) REFERENCES game (id),
  FOREIGN KEY (event_id) REFERENCES event (id),
  FOREIGN KEY (p1_id) REFERENCES player (id),
  FOREIGN KEY (p2_id) REFERENCES player (id),
  FOREIGN KEY (p3_id) REFERENCES player (id),
  FOREIGN KEY (p4_id) REFERENCES player (id),
  FOREIGN KEY (c1_id) REFERENCES game_character (id),
  FOREIGN KEY (c2_id) REFERENCES game_character (id),
  FOREIGN KEY (c3_id) REFERENCES game_character (id),
  FOREIGN KEY (c4_id) REFERENCES game_character (id),
  FOREIGN KEY (submission_id) REFERENCES submission (id)
);

CREATE TABLE metadata (
    key TEXT PRIMARY KEY,
    value TEXT
);

CREATE INDEX idx_submission_status ON submission (status);
CREATE INDEX idx_vod_c1 ON vod (c1_id);
CREATE INDEX idx_vod_c2 ON vod (c2_id);
CREATE INDEX idx_vod_p1 ON vod (p1_id);
CREATE INDEX idx_vod_p2 ON vod (p2_id);

INSERT INTO game (name) VALUES ("Project+");

-- Random = 1
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Random", "./static/characters/random.png");
-- Bowser = 2
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Bowser", "./static/characters/bowser.png");
-- Captain Falcon = 3
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Captain Falcon", "./static/characters/captain_falcon.png");
-- Charizard = 4
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Charizard", "./static/characters/charizard.png");
-- Diddy Kong = 5
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Diddy Kong", "./static/characters/diddy_kong.png");
-- Donkey Kong = 6
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Donkey Kong", "./static/characters/donkey_kong.png");
-- Falco = 7
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Falco", "./static/characters/falco.png");
-- Fox = 8
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Fox", "./static/characters/fox.png");
-- Ganondorf = 9
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Ganondorf", "./static/characters/ganondorf.png");
-- Ice Climbers = 10
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Ice Climbers", "./static/characters/ice_climbers.png");
-- Ike = 11
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Ike", "./static/characters/ike.png");
-- Ivysaur = 12
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Ivysaur", "./static/characters/ivysaur.png");
-- Jigglypuff = 13
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Jigglypuff", "./static/characters/jigglypuff.png");
-- King Dedede = 14
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "King Dedede", "./static/characters/king_dedede.png");
-- Kirby = 15
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Kirby", "./static/characters/kirby.png");
-- Knuckles = 16
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Knuckles", "./static/characters/knuckles.png");
-- Link = 17
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Link", "./static/characters/link.png");
-- Lucario = 18
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Lucario", "./static/characters/lucario.png");
-- Lucas = 19
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Lucas", "./static/characters/lucas.png");
-- Luigi = 20
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Luigi", "./static/characters/luigi.png");
-- Mario = 21
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Mario", "./static/characters/mario.png");
-- Marth = 22
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Marth", "./static/characters/marth.png");
-- Meta Knight = 23
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Meta Knight", "./static/characters/meta_knight.png");
-- Mewtwo = 24
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Mewtwo", "./static/characters/mewtwo.png");
-- Mr. Game & Watch = 25
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Mr. Game & Watch", "./static/characters/mr_game_and_watch.png");
-- Ness = 26
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Ness", "./static/characters/ness.png");
-- Olimar = 27
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Olimar", "./static/characters/olimar.png");
-- Peach = 28
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Peach", "./static/characters/peach.png");
-- Pikachu = 29
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Pikachu", "./static/characters/pikachu.png");
-- Pit = 30
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Pit", "./static/characters/pit.png");
-- R.O.B. = 31
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "R.O.B.", "./static/characters/rob.png");
-- Roy = 32
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Roy", "./static/characters/roy.png");
-- Samus = 33
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Samus", "./static/characters/samus.png");
-- Sheik = 34
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Sheik", "./static/characters/sheik.png");
-- Snake = 35
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Snake", "./static/characters/snake.png");
-- Sonic = 36
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Sonic", "./static/characters/sonic.png");
-- Squirtle = 37
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Squirtle", "./static/characters/squirtle.png");
-- Toon Link = 38
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Toon Link", "./static/characters/toon_link.png");
-- Wario = 39
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Wario", "./static/characters/wario.png");
-- Wolf = 40
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Wolf", "./static/characters/wolf.png");
-- Yoshi = 41
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Yoshi", "./static/characters/yoshi.png");
-- Zelda = 42
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Zelda", "./static/characters/zelda.png");
-- Zero Suit Samus = 43
INSERT INTO game_character (game_id, name, icon_url) VALUES (1, "Zero Suit Samus", "./static/characters/zero_suit_samus.png");
