from dataclasses import dataclass
from datetime import datetime

# c1_chars / c2_chars: [(character name, icon url), ...], one entry per character the player used.
@dataclass
class Vod:
    url: str
    event_name: str
    p1_tag: str
    c1_chars: list
    p2_tag: str
    c2_chars: list
    round: str
    vod_date: datetime

@dataclass
class Channel:
    url: str
    name: str

@dataclass
class Patch:
    name: str
    date: datetime
    url: str

@dataclass
class VodAndPatch:
    url: str
    event_name: str
    p1_tag: str
    c1_chars: list
    p2_tag: str
    c2_chars: list
    round: str
    vod_date: datetime
    patch_name: str
    patch_url: str

@dataclass
class ParsedVodTitle:
    p1: str
    p1_id: int
    p2: str
    p2_id: int
    c1: str
    c1_id: int
    c2: str
    c2_id: int
    event: str
    event_id: int
    round: str
