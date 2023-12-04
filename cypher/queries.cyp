// All stations on the Victoria Line
MATCH (l:Line {name: "Victoria Line"})-[r:CONSISTS_OF]->(s1:Station)
MATCH (s1)-[c:CONNECTS_TO]->(s2:Station)
RETURN l, r, s1, c, s2;

// Bob moves to Bond Street
MATCH (p:Person {name: "Bob"})-[r:LIVES_NEAR]->()
DELETE r;

MATCH (p:Person {name: "Bob"}), (s:Station {name: "Bond Street"})
MERGE (p)-[r:LIVES_NEAR]->(s)
RETURN p, r, s;

// Find station and line where Alison lives
MATCH (p:Person)-[rl:LIVES_NEAR]->(s:Station)
MATCH (l:Line)-[rc:CONSISTS_OF]->(s)
WHERE p.name = 'Alison'
RETURN p, s, l, rl, rc;

// Find station and line where Bob lives
MATCH (p:Person {name: 'Bob'})-[rl:LIVES_NEAR]->(s:Station)
MATCH (l:Line)-[rc:CONSISTS_OF]->(s)
RETURN p, s, l, rl, rc;

// Find path from Alison's station to Bob's station
MATCH 
    (alison:Person {name: "Alison"})-[la:LIVES_NEAR]->(sa:Station),
    (bob:Person {name: "Bob"})-[lb:LIVES_NEAR]->(sb:Station),
    p = shortestPath((sa)-[:CONNECTS_TO*]-(sb))
RETURN alison,la, bob, lb, p;

// Bob moves to Canary Wharf
MATCH (p:Person {name: "Bob"})-[r:LIVES_NEAR]->()
DELETE r;

MATCH (p:Person {name: "Bob"}), (s:Station {name: "Canary Wharf"})
MERGE (p)-[r:LIVES_NEAR]->(s)
RETURN p, r, s;