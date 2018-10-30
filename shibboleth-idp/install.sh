#/bin/bash
groupadd -r apigee
useradd -r -g apigee -d /opt/apigee -s /sbin/nologin -c "Apigee platform user" apigee
mkdir -p /opt/apigee/etc/
touch /opt/apigee/etc/defaults.sh
source /opt/apigee/etc/defaults.sh
source apigee-env.sh
source $1
#This scripts downloads the latest version of tomcat and install under /opt/apigee directories
curl -o /opt/apigee/shibboleth-identity-provider-3.4.0.tar.gz https://shibboleth.net/downloads/identity-provider/latest/shibboleth-identity-provider-3.4.0.tar.gz
tar -xvf /opt/apigee/shibboleth-identity-provider-3.4.0.tar.gz -C /opt/apigee/
cd /opt/apigee/shibboleth-identity-provider-3.4.0
echo $JAVA_HOME
echo "idp.sealer.keyPassword=${IDP_SEALER_KEYPASSWORD}" >> /tmp/idp.properties
echo "idp.sealer.storePassword=${IDP_SEALER_STOREPASSWORD}" >> /tmp/idp.properties
echo "idp.entityID=${IDP_SCHEME}://${IDP_HOSTNAME}:${IDP_PORT}/idp/shibboleth" >> /tmp/idp.properties
echo "idp.scope=${IDP_HOSTNAME}" >> /tmp/idp.properties

cat  /tmp/idp.properties
sleep 10

./bin/install.sh -Didp.src.dir=/opt/apigee/shibboleth-identity-provider-3.4.0 -Didp.target.dir=/opt/apigee/shibboleth-idp -Didp.host.name=${IDP_HOSTNAME}:${IDP_PORT} -Didp.keystore.password=${IDP_KEYSTORE_PASSWORD} -Didp.sealer.password=${IDP_SEALER_PASSWORD} -Didp.merge.properties=/tmp/idp.properties -Didp.noprompt=true

cd -

cp -fr conf/* /opt/apigee/shibboleth-idp/conf/
cp -fr messages/* /opt/apigee/shibboleth-idp/messages/
sed -i "s|EDGE_UE_URL|$EDGE_UE_URL|g" /opt/apigee/shibboleth-idp/messages/messages.properties
cp -fr views/* /opt/apigee/shibboleth-idp/views/
cp -fr webapp/css/* /opt/apigee/shibboleth-idp/edit-webapp/css/
cp -fr dist/webapps/WEB-INF/web.xml /opt/apigee/shibboleth-idp/dist/webapps/WEB-INF/web.xml
/opt/apigee/shibboleth-idp/bin/build.sh -Didp.target.dir=/opt/apigee/shibboleth-idp
chown -R ${RUN_USER}:${RUN_GROUP} /opt/apigee/shibboleth-idp/