# 初期設定
## Docker
- `docker-compose build`
- `docker-compose up -d`
- `docker-compose exec db bash`
- `docker-compose run web yarn install --check-files`
- `docker-compose run web rails webpacker:install`
- `bash> mysql -u root -p`
- `mysql> alter user 'root'@'%' identified　with mysql_native_password by [password];`
- `docker-compose down`
## DB
- `docker-compose run web rails db:create`
- `docker-compose run web rails db:migrate`
- `docker-compose run web rails db:seed`

## Yarnのパッケージが追加されたとき
- `docker-compose run yarn add xxx`

# 起動方法
`docker-compose up` もしくは `docker-compose up -d`
