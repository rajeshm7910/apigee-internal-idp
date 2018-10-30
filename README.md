# Apigee Internal IDP

## Overview

Apigee UE for OPDK comes with only SAML SSO. To adopt this for an on premise customer, they need have an IDP whch supports SAML2 SSO. This project tries to help you deploy an shibboleth idp and configure  EdgeUE with a local idp server

Further the local idp can either connect to openldap that comes with Apigee Installation or to your own directory services. Thus it makes the Apigee Edge UE available to on-premise for all customer base.


## Architecture 


## Getting Started


### Install Tomcat

```
cd apigee-tomcat
./install.sh
```


### Configure Tomcat with certificate

Tomcat is installed with self signed certiticates in the install step. Use

### Install shibboleth binaries


## License

Apache 2.0 - See [LICENSE](LICENSE) for more information.