CREATE TABLE IF NOT EXISTS movements (
    movement_id SERIAL PRIMARY KEY,
    camp_id INTEGER NOT NULL REFERENCES camps(camp_id),
    origin GEOGRAPHY(Point, 4326),
    destination GEOGRAPHY(Point, 4326),
    start_time TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    end_time TIMESTAMP WITH TIME ZONE,
    status VARCHAR(50) NOT NULL  -- Values like 'pending', 'completed', 'cancelled'
);

