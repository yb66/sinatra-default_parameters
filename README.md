# Sinatra Extension Skeleton

Quick way to get the skeleton of an extension for Sinatra going.

## Installation

    git clone git@github.com:yb66/sinatra-extension-skeleton.git sinatra-MODULENAME
    
    cd sinatra-MODULENAME
    
    bundle install --binstubs --path vendor
    
    bin/rake rename n=MODULENAME

Then fix the remotes:

    vi .git/config

Change:

> [remote "origin"]  
>   fetch = +refs/heads/*:refs/remotes/origin/*  
>   url = git@github.com:yb66/sinatra-extension-skeleton.git  

To:

> [remote "origin"]  
>   fetch = +refs/heads/*:refs/remotes/origin/*  
>   url = git@github.com:YOUR-USERNAME/sinatra-MODULENAME.git  

or you could do:


    $ git remote rm origin
    $ git remote add origin git@github.com:YOUR-USERNAME/sinatra-MODULENAME.git
    $ git config master.remote origin
    $ git config master.merge refs/heads/master

## Licence ##

  There is a licence in the LICENCE file, which you can replace with the licence you wish for your module. This, as the file says, is under MIT licence. In other words, be good!
