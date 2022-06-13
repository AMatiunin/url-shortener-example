# This is example application for url-shortener

* Ruby version 3.0.3

* Rails version 7.0.3

What can be done further:
Auth system by using gem Doorkeeper
Sophisticated rules for collision checking and validate incoming urls
Generalize approach for working with errors by adding separated module with methods to handle custom error classes
Add lifetime to records and drop links which not used more than lifetime

What can be bottleneck in case of extending system:
* We can trace possible issues by using profilers(Rack Mini Profiler, DevTrace)
* We can minimize time of response by using Memcache to cache most used short urls and clear cache once a day
* We can minimize time of response by using SQL mechanism of views(temporary table with most used short_url) or we can 
even discard database by using algorithm based on secret key which stored in production environment as variable. 
Algorithm could work with incoming param and decode slug to some string, and then if the string is correct url it could be used for redirect
