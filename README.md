<img src="https://user-images.githubusercontent.com/1028534/159812239-2614b320-f99e-4d74-82a8-70db9ba1a238.png" width="70%">


# Mulesoft Recipes

## Introduction

The idea behind this project is to keep multiple "How-to" code in one big project of the use
of Mulesoft connectors and custom code / connector implementation. The repository also makes easier to
have a reference for engineers of any level.

- ## DataWeave
     - [aggregate-values-for-loop](https://github.com/emoran/mulesoft-recipes/tree/master/src/main/mule/DataWeave/aggregate-values-for-loop) 
     - [remove-array-from-array](https://github.com/emoran/mulesoft-recipes/tree/master/src/main/mule/DataWeave/remove-array-from-array)

- ## Salesforce
    - [bulk-api-v2-insert-update](https://github.com/emoran/mulesoft-recipes/tree/master/src/main/mule/Salesforce/bulk-api-v2-insert-update) 
    - [bulk-v1-query](https://github.com/emoran/mulesoft-recipes/tree/master/src/main/mule/Salesforce/bulk-v1-query) 
    - [consume-apex-rest-service](https://github.com/emoran/mulesoft-recipes/tree/master/src/main/mule/Salesforce/consume-apex-rest-service) 
    -  [content-document-attachment](https://github.com/emoran/mulesoft-recipes/tree/master/src/main/mule/Salesforce/content-document-attachment) 
    - [get-updates-retrieve ](https://github.com/emoran/mulesoft-recipes/tree/master/src/main/mule/Salesforce/get-updates-retrieve) 
    -  [platform-events](https://github.com/emoran/mulesoft-recipes/tree/master/src/main/mule/Salesforce/platform-events) 
    - [soql-query-offset-limit ](https://github.com/emoran/mulesoft-recipes/tree/master/src/main/mule/Salesforce/soql-query-offset-limit) 
    -  [sosl-search](https://github.com/emoran/mulesoft-recipes/tree/master/src/main/mule/Salesforce/sosl-search) 
    - [upadate-custom-metadta-type ](https://github.com/emoran/mulesoft-recipes/tree/master/src/main/mule/Salesforce/upadate-custom-metadta-type) 
- ## General
    -  [dynamicMapping](https://github.com/emoran/mulesoft-recipes/tree/master/src/main/mule/general/dynamicMapping) 
    -  [idempotent-filter](https://github.com/emoran/mulesoft-recipes/tree/master/src/main/mule/general/idempotent-filter) 
    -  [parseEmailTemplate](https://github.com/emoran/mulesoft-recipes/tree/master/src/main/mule/general/parseEmailTemplate) 
    -  [recursive-flow-pagination](https://github.com/emoran/mulesoft-recipes/tree/master/src/main/mule/general/recursive-flow-pagination) 
    -  [render-html-page](https://github.com/emoran/mulesoft-recipes/tree/master/src/main/mule/general/render-html-page) 
    -  [uncompress-and-transform](https://github.com/emoran/mulesoft-recipes/tree/master/src/main/mule/general/uncompress-and-transform) 
- ## Google
    - [googleSheets ](https://github.com/emoran/mulesoft-recipes/tree/master/src/main/mule/google/googleSheets) 



## Installation

Clone the repository
```bash
  git clone https://github.com/emoran/mulesoft-recipes.git
  cd mulesoft-recipes
  mvn clean install -U
```
Import the project into Anypoint Studio



```File > Import > Anypoint Project from File System.```

## Set environment variables.

In order to do it we right clic in the project Debug As / Run As > Debug configurations.

![Screen Shot 2022-10-14 at 2 49 16 PM](https://user-images.githubusercontent.com/1028534/195920866-7a363673-becd-4694-a754-45a5aabcd53d.png)
![Screen Shot 2022-10-14 at 2 45 26 PM](https://user-images.githubusercontent.com/1028534/195920987-a0796b92-0fd0-4f73-807f-c32c3c0fe021.png)

We select the Environment tab and we can set this variables:

```
env
gmail.password
gmail.username
sfdc.password
sfdc.token
sfdc.username
```
![Screen Shot 2022-10-14 at 2 59 05 PM](https://user-images.githubusercontent.com/1028534/195921125-166ea490-a6bf-4784-87a9-517f0003b3cb.png)


## Contributing

Contributions are always welcome!

