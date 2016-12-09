chef-fips
=========

Chef Fips is an omnibus project that provides an stunnel binary with openssl fips enabled.
Having this in a seperate omnibus project bypasses the diffiulties of having multiple
openssl installations in a single omnibus project. You will likely be installing this
on top of your server project to have access to a stunnel binary. You must configure
stunnel to fit your needs after installing the built omnibus Chef Fips package:

```
/opt/fips/embedded/stunnel/stunnel.conf
```

Building a Package
------------------

This is a very simple omnibus project which builds like any other, but for a quick summary.

Spin up a box via Test Kitchen:

```
$ kitchen list # pick a kitchen image to build against
$ kitchen create <your_desired_os> # aka kitchen create default-ubuntu-1404
$ kitchen converge <your_desired_os>
```

Log into the instance and build a package:

```
$ kitchen login <your_desired_os>
```

If you want to use s3 caching, you must have an account with access to
the s3 bucket `opscode-omnibus-cache`:

```
... on the kitchen box
$ export AWS_ACCESS_KEY_ID=export AWS_ACCESS_KEY_ID=<your_id>
$ export AWS_SECRET_ACCESS_KEY=<your_key>
```

Otherwise, temporarily edit the `omnibus.rb` value for `use_s3_caching` to
`false` (but don't check in that change to git).

Finally, build the project:

```
$ source load-omnibus-toolchain.shc
$ cd chef-fipscd chef-fips
$ bundle install --binstubs
$ bin/omnibus build chef-fips
```

Your package will be in `pkg/`.



