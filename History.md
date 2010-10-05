* TODO
  * invoking rake tasks
  * showing rails load error(add bad envoronment and do there mistage(concat "some string"))
  * routes(Cucumba[:main].routes.root\_url)
  * hadling privileged ports(80) with sudo,and fix url method for it
  * ability to properly run miltiple servers
  * add loadign rails builtin controller
  * add drb\_port option to cucumba.yml
  * add drb\_ip to config file(drb ip to run on)

0.0.6 (05.10.2010)

* starting to use bundler
* optimized testing
* fixed starting drb server(it should run on 127.0.0.1) and not on host described in config/cucumba.yml
* refactored internal stuff(Cucumba::Rails => Cucumba::Railz, Cucumba:Railz::Model => Cucumba::Railz::Klass)

0.0.5 (04.10.2010)
------------------

* added:
  * [FIX] handling hard attributes(:user, :email => 'bla')
  * method execute ( Cucumba[:main].e("1+1") )

0.0.4 (01.10.2010)
-----------------------

* 1 major enhancement:
  * API was coined
  * added exceptions and method invoking
* minor changes:
  * organized files and extensions for easily writing docs(History.txt => History.md)
  * write documentation(for me to not forget what exactly to do)
  * YARD documentation generation task
  * Writed gem description
  * development gem deps
  * write tests
    * organize tests
    * write tests due to new API

older releases
--------------

* was yanked because was not enough functional or buggy
