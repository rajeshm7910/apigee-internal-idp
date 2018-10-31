# Apigee Internal IDP

## Overview

Apigee UE for OPDK comes with only SAML SSO. To adopt this for an on premise customer, they need have an IDP whch supports SAML2 SSO. This project tries to help you deploy an shibboleth idp and configure  EdgeUE with a local idp server

Further the local idp can either connect to openldap that comes with Apigee Installation or to your own directory services. Thus it makes the Apigee Edge UE available to on-premise for all customer base.


## Architecture 


## Getting Started


### Install Java and Set the JAVA_HOME 

sudo yum install java-1.8.0-openjdk -y


### Install Tomcat

```
cd apigee-tomcat
./install.sh
```


### Configure Tomcat with certificates

The initial install command installs self signed certificates for convinience. However if you want to redo the certificate or use your own certificates, follow these steps


- Create your own Self Signed
```
mkdir -p /opt/apigee/apache-tomcat-idp/conf/certs
cd /opt/apigee/apache-tomcat-idp/conf/certs
sudo openssl genrsa -aes256 -passout pass:Secret123 -out key.pem 2048
sudo openssl rsa -in key.pem -passin pass:Secret123  -out key.pem
sudo openssl req -x509 -sha256 -new -key key.pem -out cert.csr  -subj "/C=US/ST=FooState/L=FooLocation/O=Foobar/OU=FooUnit/CN=Foobar.com/emailAddress=foo@ba
r.com" -passin pass:Secret123
sudo openssl x509 -sha256 -days 365 -in cert.csr -signkey key.pem -out cert.pem -passin pass:Secret123
```

- Change to p12 format from cert and key
```
sudo openssl pkcs12 -export -in cert.pem -inkey key.pem -out cert.p12 -password pass:Secret123
```
- Change to keystore format from p12 cert. Specify other parameter as needed.
```
sudo keytool -importkeystore -srckeystore cert.p12  -srcstoretype PKCS12  -destkeystore cert.jks -deststoretype JKS -srcstorepass Secret123 -deststorepass Secret123
```

- Edit  /opt/apigee/apache-tomcat-idp/conf/server.xml and change accordingly
```
<Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol" 
                    maxThreads="150" SSLEnabled="true" scheme="https" secure="true" 
                    clientAuth="false" sslProtocol="TLS" 
                    keystoreFile="conf/certs/cert.jks" keystorePass="Secret123">
    </Connector>
```

### Install shibboleth

- Create a config file and install shibboleth with the config file

```
IDP_HOSTNAME=<public hostname>
IDP_PORT=8443
IDP_SCHEME=https
IDP_KEYSTORE_PASSWORD=Secret123
IDP_SEALER_KEYPASSWORD=Secret123
IDP_SEALER_STOREPASSWORD=Secret123
EDGE_UE_URL=http://<hostname>:3001
APIGEE_SSO_URL=http://<apigee-sso-hostname>:9099
ADMIN_EMAIL=opdk@apigee.com
APIGEE_ADMINPW=Secret123
```

- Install shibboleth
```
cd shibboleth-idp
./install.sh idp-config.txt
```

### Changes routes in edge-management-ui box

```
cd edge-management-ui
./configure.sh
```

### Start Apigee Internal Idp Service

```
/opt/apigee/apache-tomcat-idp/etc/init.d/apache-tomact-idp start
```

### Stop Apigee Internal Idp Service

```
/opt/apigee/apache-tomcat-idp/etc/init.d/apache-tomact-idp stop
```

### Get the metadata of Internal idp

You should be able to access the idp metadata:
```
curl -k https://<idp-hostname>:<idp-port>/idp/shibboleth
```

### Configue UE with this idp

Follow the documentation [here] https://docs.apigee.com/private-cloud/v4.18.05/installing-beta-release-edge-new-unified-experience


## License

Apache 2.0 - See [LICENSE](LICENSE) for more information.