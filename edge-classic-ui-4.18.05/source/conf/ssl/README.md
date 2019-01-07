This folder contains several sample files useful for running play serving https
 
``` 
 ./activator -jvm-debug 9999 -Dconfig.file=conf/apigee.dev.local.mars.conf \
    -Dhttp.port=disabled -Dhttps.port=9443 -Dhttps.keyStore=conf/ssl/sample-keystore.jks.jks \ 
    -Dhttps.keyStorePasswordEncrypted=d7c7828080f1a51684cd4bbe7ee57ef4 \
    -Dplay.http.sslengineprovider=services.CustomSSLEngineProvider run
```    
    
# Discussion

Normally play accepts the keystore password via the system property 

```
https.keyStorePassword
```

which is in clear text

We added a custom very simple SSLEngineProvider that accepts another property
```
https.keyStorePasswordEncrypted
```

This needs to be used in conjunction with  

```
play.http.sslengineprovider={T}conf_ssl_README_play.http.sslengineprovider{/T}
```


# References

* https://www.playframework.com/documentation/2.3.4/ConfiguringHttps
