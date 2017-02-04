FROM dockcross/manylinux-x86:latest
MAINTAINER guyskk "guyskk@qq.com"

# install fftw3
# http://www.fftw.org/fftw3_doc/Installation-on-Unix.html
# http://www.fftw.org/fftw-3.3.6-pl1.tar.gz
ADD fftw-3.3.6-pl1.tar.gz /tmp/fftw3/
WORKDIR /tmp/fftw3/fftw-3.3.6-pl1
# TODO: optimize build params 
# https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/fftw#n34
RUN ./configure --enable-shared && make && make install

# build wheel
VOLUME /io/
WORKDIR /io/tools
RUN /opt/python/cp36-cp36m/bin/pip install invoke
ENTRYPOINT ["/opt/python/cp36-cp36m/bin/inv"]
CMD ["build_all"]