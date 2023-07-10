# routes-microservice
Quick mock-up of a back-end service to get the best route for a user


# Requirements
-------------

- Node 18 and npm must be installed
- If you already use a different version of Node you should install a node version manager first

Instructions on how to install "nvm" Node version manager
https://github.com/nvm-sh/nvm

# Configuration
-------------

Before running this 
- if necessary change the database name in the db dump file in the "db-dump" folder
- import the db dump file to your postgress
- change the db acces data in the model.ts file to reflect your local configuration
(the db acces and db initialisation should be in a db helper library ... but this is a quick mockup)

```
#install required libraries
npm install 
#run the service ... this will run the tests + build process and start the service
npm run start
```
