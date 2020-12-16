MATCH (e:Email)-[r]->(c:Content)
DELETE r,e,c;
