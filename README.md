Star-API
========
The API has the following components

## Dependencies

1. Rvm, ruby, bundler
2. Sqlite on development and postgresql on production
3. Elastichsearch to store search metadata
 
## The rails API

You need to clone repo, run 
```
bundle install
rake db:migrate
rake parsers:milkyway:all
rake search:rebuild
```

The ```rake parsers:milkyway:all``` rake task fetches the DU data set from http://research.amnh.org/users/abbott/dudata/ and sets to Postgres Backend.

The ```rake search:rebuild``` builds search index for all these data sets.


## Features =

1. Available resources as REST get api: stars, exo_planets, local_groups, open clusters, constellations
2. Paginated queries
3. Search endpoint at ```/api/v1/search?q=<search query>``` to search for all available names and labels
4. Filter queries like ```/api/v1/stars?min[distl]=10&max[distl]=20``` finds all stars whose distl values are between 10 and 20. Its applicable to any comparable field available in response data of a particular resource
