./create-release.sh

rm -fr /usr/share/nginx/html/customrepo/*
mv dist/1.0.0/*.rpm /usr/share/nginx/html/customrepo/
mv dist/1.0.0/*.tar.gz /usr/share/nginx/html/customrepo/
mv dist/1.0.0/*.sh /usr/share/nginx/html/customrepo/
createrepo --update /usr/share/nginx/html/customrepo/
yum --enablerepo=apigee-idp clean metadata
sed -i.bak "s/enabled = 0/enabled = 1/g" /etc/yum.repos.d/custo.repo
sed -i.bak "s/enabled = 1/enabled = 0/g" /etc/yum.repos.d/idp.repo
