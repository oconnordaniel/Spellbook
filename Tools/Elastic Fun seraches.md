
```
GET /msazure_signins-*/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "match_phrase": {
            "Azure.ipAddress": " ip address goes here"
          }
        },
        {
          "range": {
            "@timestamp": {
              "gte": "now-7d/d",
              "lte": "now"
            }
          }
        }
      ]
    }
  },
  "aggs": {
    "uniqu_count": {
      "cardinality": {
        "field": "Azure.userPrincipalName"
      }
    }
  }
}
```