# Blockfreight, Inc. ERP

### Quickstart ###

1.  $ git clone https://github.com/blockfreight/ofbiz-erp.git .

2. Edit environment variables in the file .env with right parameters according your needs:
```  
   DEFAULT_HOST: "127.0.0.1"
   VIRTUAL_HOST: "127.0.0.1"
   LETSENCRYPT_HOST: "127.0.0.1"
   LETSENCRYPT_EMAIL: "SET_AN_EMAIL_TO_GET_LETS_ENCRYPT_WARNINGS"
   POSTGRES_USER: "ofbiz"
   POSTGRES_PASSWORD: "ofbiz"
   OFBIZ_DB: "ofbiz"
   OFBIZ_OLAP_DB: "ofbizolap"
   OFBIZ_TENANT_DB: "ofbiztentant"   
```   
3. Start everything running:
```
    docker-compose up -d 
```    
4. Wait a bit and then you can access everything from the domain you provided in parameters. By default it redirects to SSL.

5. Postgresql is persisting data in volume pgdata. Of course a proper backup policy for DB is needed.

### Visit OFBiz through your browser:

Order Back Office: https://your-domain/ordermgr

Accounting Back Office: https://your-domain/accounting

Administrator interface: https://your-domain/webtools

NOTE: You can log in with the user admin and password ofbiz for the first time and you are prompted to change password.
