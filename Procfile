web-pub-connect: bundle exec actn-api public/connect -p 6000 -sv -c config/public.rb
web-pub-query:   bundle exec actn-api public/query   -p 6001 -sv -c config/public.rb
web-pub-upsert:  bundle exec actn-api public/upsert  -p 6002 -sv -c config/public.rb
web-pub-delete:  bundle exec actn-api public/delete  -p 6003 -sv -c config/public.rb

web-core-back:  bundle exec actn-api core/backend    -p 7000 -sv -c config/core.rb
web-core-front: bundle exec actn-api core/frontend   -p 7001 -sv -c config/core.rb

worker-jobs: bundle exec rake jobs:work

web: haproxy -f ./config/haproxy.cfg 
