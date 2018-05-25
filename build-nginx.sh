set -e

rm -rf nginx-build
cp -r nginx nginx-build
cd nginx-build

./build.sh
