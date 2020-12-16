CREATE CONSTRAINT ON (c:Content) ASSERT c.id IS UNIQUE;
CREATE CONSTRAINT ON (c:DOI) ASSERT c.id IS UNIQUE;

USING PERIODIC COMMIT
LOAD CSV 
FROM "file:///doi-content.tsv.gz" AS csvLine 
FIELDTERMINATOR '\t'
MERGE (d:DOI { id: csvLine[0]})
MERGE (c:Content { id: csvLine[1]})
MERGE (d)-[:IN]->(c);




