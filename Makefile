.PHONY: all clean


CWD = $(shell pwd)
STAGING = $(CWD)/staging
WEB_SERVER_TEMPLATE = $(shell cd ../web_server_template && pwd)

CD = cd
CP = cp -pdr
RM = rm -f -r
MD = mkdir
TAR = tar -xf


all : clean
	$(MD) $(STAGING) output
	$(CD) $(STAGING) && $(MD) bin  etc etc/app etc/php-fpm.d htdocs \
		log log/nginx logs run  sbin  tmp  yii html lib
	$(CP) $(CWD)/etc/app/web.conf $(STAGING)/etc/app/web.conf
	$(CP) $(CWD)/etc/php-fpm.d/www.conf $(STAGING)/etc/php-fpm.d/www.conf
	$(CP) $(CWD)/htdocs $(STAGING)
	$(CP) $(WEB_SERVER_TEMPLATE)/staging/bin/* $(STAGING)/bin/
	$(CP) $(WEB_SERVER_TEMPLATE)/staging/etc/fastcgi_params $(STAGING)/etc/
	$(CP) $(WEB_SERVER_TEMPLATE)/staging/etc/nginx.conf $(STAGING)/etc/
	$(CP) $(WEB_SERVER_TEMPLATE)/staging/etc/scgi_params $(STAGING)/etc/
	$(CP) $(WEB_SERVER_TEMPLATE)/staging/etc/fastcgi.conf $(STAGING)/etc/
	$(CP) $(WEB_SERVER_TEMPLATE)/staging/etc/mime.types $(STAGING)/etc/
	$(CP) $(WEB_SERVER_TEMPLATE)/staging/etc/php-fpm.conf $(STAGING)/etc/
	$(CP) $(WEB_SERVER_TEMPLATE)/staging/etc/php.ini $(STAGING)/etc/
	$(CP) $(WEB_SERVER_TEMPLATE)/staging/etc/uwsgi_params $(STAGING)/etc/
	$(CP) $(WEB_SERVER_TEMPLATE)/staging/lib/* $(STAGING)/lib/
	$(CP) $(WEB_SERVER_TEMPLATE)/staging/sbin/* $(STAGING)/sbin/
	$(CP) $(WEB_SERVER_TEMPLATE)/staging/yii/* $(STAGING)/yii/
	$(CD) $(STAGING)/yii/ && $(TAR) yii-1.1.21.733ac5.tar.gz



clean :
	$(RM) $(STAGING)
	$(RM) output

