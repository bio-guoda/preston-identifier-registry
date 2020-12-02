CREATE CONSTRAINT ON (c:Content) ASSERT c.id IS UNIQUE;
CREATE CONSTRAINT ON (c:Location) ASSERT c.id IS UNIQUE;

USING PERIODIC COMMIT
LOAD CSV 
FROM "file:///location-content.tsv.gz" AS csvLine 
FIELDTERMINATOR '\t'
MERGE (l:Location { id: csvLine[0]})
MERGE (c:Content { id: csvLine[1]})
CREATE (l)-[:HOSTED]->(c);



