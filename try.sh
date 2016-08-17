#!/bin/bash

# Automates sdist, bdist, and virtualenv creation for python package testing.

set -x
set -e

rm -rf 34-sdist 34-bdist

python3 setup.py sdist bdist_wheel

virtualenv 34-sdist
34-sdist/bin/pip install dist/sphinxmark-0.1.0.tar.gz

virtualenv 34-bdist
34-bdist/bin/pip install dist/sphinxmark-0.1.0-py2.py3-none-any.whl

rm -rf build sphinxmark.egg-info

set +e
set +x
