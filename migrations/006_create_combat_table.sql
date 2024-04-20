CREATE TABLE IF NOT EXISTS combat (
    combat_id SERIAL PRIMARY KEY,
    attacker_camp_id INTEGER NOT NULL REFERENCES camps(camp_id),
    defender_camp_id INTEGER NOT NULL REFERENCES camps(camp_id),
    outcome VARCHAR(50),  -- Values like 'attacker_win', 'defender_win', 'draw'
    combat_time TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

