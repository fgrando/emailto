VERSION=2.0

mkdir emailto-$VERSION
cd emailto-$VERSION

dh_make -e fernandozatt@gmail.com.br --packagename emailto --copyright mit  --createorig --indep
mkdir essentials
mv debian/{changelog,rules,control} essentials
rm -rf debian/
mv essentials/ debian


rm -rf tree
mkdir -p tree/usr/bin
cp ../../emailto tree/usr/bin/

echo './tree/* ./' > debian/.install

echo "Edit install"
cat debian/emailto.install

nano debian/changelog

debuild
cd ..

