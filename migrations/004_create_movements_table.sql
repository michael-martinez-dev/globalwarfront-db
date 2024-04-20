CREATE TABLE IF NOT EXISTS camp_troops (
    camp_id INTEGER NOT NULL REFERENCES camps(camp_id),
    troop_id INTEGER NOT NULL REFERENCES troops(troop_id),
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (camp_id, troop_id)
);

