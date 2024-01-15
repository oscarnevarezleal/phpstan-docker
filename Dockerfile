FROM composer:latest
WORKDIR /workspace
RUN composer init --name composer/composer
RUN composer require --dev phpstan/phpstan
RUN composer require --dev orchestra/testbench
RUN composer require larastan/larastan:^2.0 --dev
RUN composer config --no-plugins allow-plugins.phpstan/extension-installer true
RUN composer require --dev phpstan/extension-installer
RUN composer require --dev phpstan/phpstan-beberlei-assert
ENTRYPOINT ["php","vendor/bin/phpstan"]
