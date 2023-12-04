// Import stations
LOAD CSV WITH HEADERS FROM 'stations.csv' as r
CREATE (s:Station {id: r.id})
SET s.name = r.name
RETURN s;

// Import lines
LOAD CSV WITH HEADERS FROM 'lines_final.csv' as r
MATCH (s1:Station {id: r.station1}), (s2:Station {id: r.station2})
MERGE (s1)-[:CONNECTS_TO]->(s2)
MERGE (l:Line {id: r.line}) SET l.color = r.color, l.name = r.line_name
MERGE (l)-[:CONSISTS_OF]->(s1)
MERGE (l)-[:CONSISTS_OF]->(s2)
RETURN l, s1, s2;

// Import persons
LOAD CSV WITH HEADERS FROM 'person.csv' as r
MATCH (s:Station {id: r.station})
CREATE (p:Person {id: r.id}) SET p.name = r.name
MERGE (p)-[:LIVES_NEAR]->(s)
RETURN p, s;

// Create indexes
CREATE TEXT INDEX StationByName IF NOT EXISTS
FOR (n:Station) ON (n.name);

CREATE TEXT INDEX PersonByName IF NOT EXISTS
FOR (n:Person) ON (n.name);