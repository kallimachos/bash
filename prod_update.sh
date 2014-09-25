!/bin/bash

loc=$(pwd)

echo "Updating 3.0..."
for dir in ~/csp/cloudforms/3.0/*; do
    cd "$dir" && csprocessor pull
    sed -i '0,/Product = CloudForms/s/Product = CloudForms/Product = Red Hat CloudForms/' *.contentspec
    #sed -i 's/Product = Red Hat CloudForms/Product = CloudForms/g' *.contentspec
    #head -n 20 *.contentspec
    csprocessor push
done

echo "Updating 3.1 beta..."
for dir in ~/csp/cloudforms/beta/*; do
    cd "$dir" && csprocessor pull
    sed -i '0,/Product = CloudForms/s/Product = CloudForms/Product = Red Hat CloudForms/' *.contentspec
    #sed -i 's/Product = Red Hat CloudForms/Product = CloudForms/g' *.contentspec
    #head -n 20 *.contentspec
    csprocessor push
done

echo "Updating 3.1..."
for dir in ~/csp/cloudforms/3.1/*; do
    cd "$dir" && csprocessor pull
    sed -i '0,/Product = CloudForms/s/Product = CloudForms/Product = Red Hat CloudForms/' *.contentspec
    #sed -i 's/Product = Red Hat CloudForms/Product = CloudForms/g' *.contentspec
    #head -n 20 *.contentspec
    csprocessor push
done

echo "Checking 3.0..."
for dir in ~/csp/cloudforms/3.0/*; do
    cd "$dir"
    grep -H "BZProduct = Red Hat CloudForms" *.contentspec
done

echo "Checking 3.1 beta..."
for dir in ~/csp/cloudforms/beta/*; do
    cd "$dir"
    grep -H "BZProduct = Red Hat CloudForms" *.contentspec
done

echo "Checking 3.1..."
for dir in ~/csp/cloudforms/3.1/*; do
    cd "$dir"
    grep -H "BZProduct = Red Hat CloudForms" *.contentspec
done

cd $loc