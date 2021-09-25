#!/bin/bash

# Usage:
# flutter test --coverage --merge-coverage
# sh coverage.sh core data domain presentation

mkdir coverage
touch coverage/lcov.base.info

for module in "$@"
do
    echo "testing $module..."
    cd "$module" || exit
    flutter test --coverage --coverage-path=coverage/"${module}".info
    var1=lib/
    var2=${module}/lib/

    sed -i "s@${var1}@${var2}@" coverage/"${module}".info
    cat coverage/"${module}".info >> ../coverage/lcov.base.info
    cd ..
done