# Uncompress and Transform



## Introduction

In this sample I will try to show a quick sample on how we can extract the content from a .zip file
that contains around 24 images (69.8 MB) size and Xmx256m -Xms256m memory set.

The main idea is to read the file and extract the content. For this is important to mentioned we need to import the compression
module and use the extract connector. The extract connector will uncompress the .zip / .gzip file and we should be able to make use 
the binary. In this sample I'm using images, but in different scenarios we should be able to process also files like CSV, XML or txt, 
In this case we should be able to use the files and make transormations.

One small consideration, whenever you need to uncompress a file with multiple files "Extract" is the operation you need to use, if is a single file you can use 
"Decompress"

![Screenshot 2022-11-07 at 1 05 03 PM](https://user-images.githubusercontent.com/1028534/200392749-48990d4d-8535-4a40-9fdb-cbb69b5c883e.png)



## Documentation

[Compression Documentation](https://docs.mulesoft.com/compression-module/2.2/compression-documentation)

