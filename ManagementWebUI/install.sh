export MANAGEMENT_WEB_UI_DIR=$EASY_MAIL_DIR/ManagementWebUI

mkdir $MANAGEMENT_WEB_UI_DIR && cd $MANAGEMENT_WEB_UI_DIR


wget https://github.com/runeasymail/ManagementWebUI/releases/download/1/ManagementWebUI.tar.gz
tar -xvf ManagementWebUI.tar.gz
rm ManagementWebUI.tar.gz

cp $CURRENT_DIR/ManagementWebUI/ManagementWebUI-nginx.conf $MANAGEMENT_WEB_UI_DIR/ManagementWebUI-nginx.conf

sed -i "s|# __EASY_MAIL_INCLUDE_2__|include $MANAGEMENT_WEB_UI_DIR/ManagementWebUI-nginx.conf;|g" /etc/nginx/sites-enabled/roundcube
 	
service nginx reload
 
