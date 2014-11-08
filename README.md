Star-API
========

#Category: Toolkit
#Presentation URL: (Presentation)[https://speakerdeck.com/surenm/building-rest-api-for-digital-universe]


## Dependencies

1. Rvm, ruby, bundler
2. Sqlite on development and Postgresql on production
3. ElasticSearch to store search metadata
 
## Setting up the Rails API

You need to clone repo, run 
```
bundle install
rake db:migrate
rake parsers:milkyway:all
rake search:rebuild
```

The ```rake parsers:milkyway:all``` rake task fetches the DU data set from http://research.amnh.org/users/abbott/dudata/ and stores it into Postgres.

The ```rake search:rebuild``` builds search index for all these data sets.


## Features

1. Available resources as REST get api: stars, exo_planets, local_groups, open clusters, constellations
2. Paginated queries
3. Search endpoint at ```/api/v1/search?q=<search query>``` to search for all available names and labels
4. Filter queries like ```/api/v1/stars?min[distl]=10&max[distl]=20``` finds all stars whose distl values are between 10 and 20. Its applicable to any comparable field available in response data of a particular resource

## Examples query filters

1. Run this query to filter only blue stars:  
[http://star-api.herokuapp.com/api/v1/stars?min[colorb_v]=-1&max[colorb_v]=0](http://star-api.herokuapp.com/api/v1/stars?min[colorb_v]=-1&max[colorb_v]=0)
2. To see only red stars:
[http://star-api.herokuapp.com/api/v1/stars?min[colorb_v]=0&max[colorb_v]=1](http://star-api.herokuapp.com/api/v1/stars?min[colorb_v]=0&max[colorb_v]=1)
3. To filter stars you can see with the naked yield: 
[http://star-api.herokuapp.com/api/v1/stars?min[appmag]=-2.5&max[appmag]=6.5](http://star-api.herokuapp.com/api/v1/stars?min[appmag]=-2.5&max[appmag]=6.5)
4. To see stars brighter than 7.5 mag: 
[http://star-api.herokuapp.com/api/v1/stars?max[appmag]=7.5](http://star-api.herokuapp.com/api/v1/stars?max[appmag]=7.5)
5. To see only the trig parallax stars: 
[http://star-api.herokuapp.com/api/v1/stars?dcalc=1](http://star-api.herokuapp.com/api/v1/stars?dcalc=1)
6.  To see only the weighted mean stars: 
[http://star-api.herokuapp.com/api/v1/stars?dcalc=2](http://star-api.herokuapp.com/api/v1/stars?dcalc=2)
7. To see all the intrinsically bright stars:
[http://star-api.herokuapp.com/api/v1/stars?min[absmag]=10&max[absmag]=-3](http://star-api.herokuapp.com/api/v1/stars?min[absmag]=-10&max[absmag]=-3)
8. To see all the intrinsically faint stars: 
[http://star-api.herokuapp.com/api/v1/stars?min[absmag]=0&max[absmag]=-3](http://star-api.herokuapp.com/api/v1/stars?min[absmag]=0&max[absmag]=10)
9. To see all stars within 100 light-years:
[http://star-api.herokuapp.com/api/v1/stars?max[distly]=100](http://star-api.herokuapp.com/api/v1/stars?max[distly]=100)
9. To see all stars within 500 light-years:
[http://star-api.herokuapp.com/api/v1/stars?max[distly]=500](http://star-api.herokuapp.com/api/v1/stars?max[distly]=500)
