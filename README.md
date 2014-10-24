# README #

This README would normally document whatever steps are necessary to get the
application up and running.

## Requirement ##

* Ruby 2.1.3
* Rails 4
* For more see [Gemfile](Gemfile)

## Reference ##

* [Delayed Job adapter for active job ](https://github.com/collectiveidea/delayed_job)
* [Active job document](http://edgeguides.rubyonrails.org/active_job_basics.html)

## Features ##

* Login/logout
* multi language suported(quick change language from links)
* Bootstrap 3
* Permission setting with hash for each controller(implement from ApplicationController)
* Using bower to manage front end plugin requirement

## Todo ##

* Registration suport
* Active by email with token key
* Forgot password
* Using Angularjs
* ...

## Change log ##

* 10/10/2014 :
 
1. Support multi language

>Using t() method of rails, 
>run program to test
>Edit new key in missing_translations.yml
>Run command `bundle exec merge_missing_translations`