-- Enable PostGIS (includes geography type)
CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE IF NOT EXISTS camps (
    camp_id SERIAL PRIMARY KEY,
    player_id INTEGER NOT NULL REFERENCES players(player_id),
    location GEOGRAPHY(Point, 4326),  -- Storing location as a point with latitude and longitude
    camp_name VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

