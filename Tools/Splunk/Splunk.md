<https://docs.splunk.com/Documentation/Splunk/9.3.2/SearchReference/Search>

Unlike Elastic, you specify the index in the query `index=<indexname>`
Indexes that start with an _ are internal and hidden by default. Hidden indexes will not show up in wildcard searches unless the _ is added to the search. 

Use `|` to filter the output of one search to another (like bash)

Each query is `field_name=key_value`

`| makeresults` allows you to create new dataset
