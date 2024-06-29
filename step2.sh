echo;

apt upgrade;

apt update;

apt install uuid-runtime wget zip;

apt install software-properties-common ca-certificates lsb-release apt-transport-https;

wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg;

sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list';

apt update;

apt install php7.4 php7.4-curl php7.4-dev php7.4-mbstring -y;

wget https://github.com/FebyZamsee/ioncube-installer/ioncube.zip;

unzip ioncube.zip;

if [ -n "$(getprop ro.product.cpu.abilist64)" ]; then
    cpu='64'
    cp bahan/64/ioncube_loader_lin_7.4.so /usr/lib/php;
else
    cpu='32'
    cp bahan/32/ioncube_loader_lin_7.4.so /usr/lib/php;
fi




mv /etc/php/7.4/cli/php.ini /etc/php/7.4/cli/php.ini.back;

cp bahan/php.ini /etc/php/7.4/cli/php.ini;

php -v