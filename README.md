### Docker rpmbuild

Simple image to create SRPMS/RPMS. Installed packages

* rpm-build (main tool: ```rpmbuild```)
* rpmdevtools (main tool: ```spectool```)
* mock 

The container runs as user ```rpmbuild```, but has full sudo rights for example to install dependencies (if necessary).

The image is mainly intended to create SRPMs on [Travis-CI](https://travis-ci.org/) which then can be build on [copr](https://copr.fedoraproject.org/).

### Example

Suppose your rpm build tree is located at ```/home/myuser/rpmbuild/```

```
docker run -it --rm \
  -v /home/myuser/rpmbuild/:/home/rpmbuild/rpmbuild \
  mgruener/rpmbuild \
  spectool -R -g rpmbuild/SPECS/foobar.spec
```

This would download all Sources / Patches references in the ```foobar.spec``` spectile to ```/home/myuser/rpmbuild/SOURCES```

Executing

```
docker run -it --rm \
  -v /home/myuser/rpmbuild/:/home/rpmbuild/rpmbuild \
  mgruener/rpmbuild \
  rpmbuild -bs rpmbuild/SPECS/foobar.spec
```

would then create a ```foobar*.src.rpm``` SRPM in ```/home/myuser/rpmbuild/SRPMS```.
