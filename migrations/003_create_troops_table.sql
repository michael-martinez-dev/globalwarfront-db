CREATE TABLE IF NOT EXISTS troops (
    troop_id SERIAL PRIMARY KEY,
    type VARCHAR(100) NOT NULL,
    attack_strength INTEGER NOT NULL,
    defense_strength INTEGER NOT NULL,
    speed INTEGER NOT NULL
);

