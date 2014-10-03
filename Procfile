web-pub-connect: bundle exec actn-api public/connect -p 6000 -sv
web-pub-query:   bundle exec actn-api public/query   -p 6001 -sv 
web-pub-upsert:  bundle exec actn-api public/upsert  -p 6002 -sv 
web-pub-delete:  bundle exec actn-api public/delete  -p 6003 -sv 

web-core-back:  bundle exec actn-api core/backend    -p 7000 -sv 
web-core-front: bundle exec actn-api core/frontend   -p 7001 -sv 

worker-jobs: bundle exec rake jobs:work

web: haproxy -f ./config/haproxy.cfg 
