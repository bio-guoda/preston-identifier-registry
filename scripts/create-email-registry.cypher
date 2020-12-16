CREATE CONSTRAINT ON (c:Content) ASSERT c.id IS UNIQUE;

CREATE CONSTRAINT ON (c:Email) ASSERT c.id IS UNIQUE;

USING PERIODIC COMMIT
LOAD CSV 
FROM "file:///email-content.tsv.gz" AS csvLine 
FIELDTERMINATOR '\t'
MERGE (e:Email { id: csvLine[0]})
MERGE (c:Content { id: csvLine[1]})
MERGE (e)-[:IN]->(c);




