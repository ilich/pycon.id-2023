# pycon.id-2023

London Tube Graph. Scripts from my talk at [Python.ID 2023](https://pycon.id/)

## Installation

You need [Poetry](https://python-poetry.org/) to setup the dependencies

```bash
poetry install
```

## Neo4j

You can get free Neo4j database in the Cloud using Neo4j AuraDB[](https://neo4j.com/cloud/platform/aura-graph-database/) offering. The free plan is enough to run samples from this presentation.

### Setting up Neo4j project

* [Create Neo4j AuraDB instance](https://neo4j.com/docs/aura/auradb/getting-started/create-database/)
* Upload **data/stations.csv**, **data/lines_final.csv**, **data/person.csv** to Google Drive (or any other cloud drive) and make the files publicly available
* Update **cypher/import_data.cyp** script to point to the CSV files
* Run **cypher/import_data.cyp** in Neo4j AuraDB console
* Update database connection settings in **db_config.env** file

## References

* https://commons.wikimedia.org/wiki/London_Underground_geographic_maps
* https://networkrepository.com/
* https://networkx.org/
* https://pyvis.readthedocs.io/en/latest/
* https://graphviz.org/
* https://graphviz.readthedocs.io/en/stable/
* https://neo4j.com/
* https://neo4j.com/docs/api/python-driver/current/

