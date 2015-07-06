title: Store files to GridFS in Meteor app
date: 2015-07-06 12:23:33
tags:
  - meteor
  - mongo
  - gridfs
---
Background
----------

Recently I've started a new Meteor-based project which involves the ability for users to store their own images in the cloud. I've considered a number of options to provide this, from storing to local FS to Amazon S3. In the end I've decided that it would be convinient to store files in Mongo's GridFS. I'd need a Mongo cluster anyway, so why not also store the files there.
But it turned out that there is no built-in support in Meteor for GridFS.
<!-- more -->
There are a number of plugins out there, the largest of them are [file-collection](https://atmospherejs.com/vsivsi/file-collection) and [collection-fs](https://atmospherejs.com/cfs/gridfs). I've decided to not use any of them, because they kinda trying to do too much for me, both of them add HTTP upload features, for example. CollectionFS is big-ass bunch of plugins actually, that tries to do a lot (but kinda not getting along very well with the latest Meteor, and audit-argument-check plugin, for example).
So, after a while I've stumbled upon [this StackOverflow answer](http://stackoverflow.com/a/27925566/554966), which gave me an idea of how to quickly implement GridFS-based store.

Meteor Hack
-----------

I'm using the following code on Meteor 1.1.0.2, not everything here is a part of public API, so it may not work for other versions.
To make things simple, I've decided to just use Mongo's Node.js driver, that is used inside the Meteor itself.

    // Access GridStore API
    var GridStore = MongoInternals.NpmModule.GridStore;

    // Access default mongo database
    var db = MongoInternals.defaultRemoteCollectionDriver().mongo.db;

    // Reading file from the GridFS by filename
    new GridStore(db, filename, 'r').open(Meteor.bindEnvironment(function(err, gridStore) {
        var stream = gridStore.stream();
        // .. do something with stream
    }));

    // Writing data to GridFS
    new GridStore(db, filename, 'w').open(Meteor.bindEnvironment(function(err, gridStore) {
        // Write string or buffer data to file
        gridStore.write(data, true, function(err, doc) { /* ... */ });

        // Or write local FS file
        gridStore.writeFile(localname, function(err, doc) { /* ... */ });
    }));

It's odd that GridStore API does not provide a way to get file with id, but only with filename, which may not be unique. So you must take care about the uniqueness of filename (probably using some combinations of ObjectID's).
