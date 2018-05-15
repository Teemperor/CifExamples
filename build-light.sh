set -e

build_dir="lighttpd-build"

rm -rf "$build_dir"
mkdir "$build_dir"
cd "$build_dir"

cmake -DCMAKE_BUILD_TYPE=Release -GNinja ../lighttpd

ninja -j3
