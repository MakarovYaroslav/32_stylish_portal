# Тестовый стенд для разработки новой CSS-библиотеки
Тестовый стенд на базе Nginx в роли reverse-proxy настроен на проксирование двух сайтов: [howmanyshares.com](http://www.howmanyshares.com/) и [sitestatus.ru](http://sitestatus.ru/). 

Для каждого из них используется отдельный порт на IP-адресе 127.0.0.1.

На этих сайтах CSS файл подменяется на style.css из данного проекта, находящийся в папке dist.

# Как тестировать

Шаг 1. Для начала необходимо установить Nginx.
```
sudo apt-get update
sudo apt-get install nginx
sudo service nginx start
```
Проверить корректность установки можно пройдя по [ссылке](http://localhost/). Вы должны увидеть приветственное сообщение Nginx.

Шаг 2. Установить пакет для генерации конфигурационного файла.
```
sudo pip3 install envtpl
```

Шаг 3. Сгенерировать конфигурационный файл nginx.conf из шаблона nginx.conf.tpl. Для этого введите в консоли:
```
CSSFILE=/full_path_to_new_css_file/style.css envtpl nginx.conf.tpl
```
где вместо full_path_to_new_css_file необходимо указать полный путь до css-файла style.css.

После этого в будет сгенерирован конфигурационный файл nginx.conf, а файл-шаблон будет удален.

Если необходимо не удалять файл-шаблон, то команда генерации конфигурационного файла будет выглядеть следующим образом:
```
CSSFILE=/full_path_to_new_css_file/style.css envtpl nginx.conf.tpl --keep-template
```

Шаг 4. Создать символьную ссылку на конфигурационный файл nginx.conf.
```
sudo ln -s /full_path_to_32_style_portal_folder/nginx.conf /etc/nginx/nginx.conf
```
где вместо full_path_to_32_style_portal_folder необходимо указать полный путь до папки с проектом.


Шаг 5. Выполнить перезагрузку конфигурационного файла.
```
sudo service nginx reload
```
После всего этого можно посмотреть на проксируемые сайты: [howmanyshares.com](http://localhost:5002/) и [sitestatus.ru](http://localhost:5001/).

# Цели проекта

Код написан в учебных целях. Обучающие курсы для веб-разработчиков - [DEVMAN.org](https://devman.org)
