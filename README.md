## Usage

1. bundle install
2. rake ar:create && rake ar:migrate
3. rake seed

## Heroku Deploy

1. heroku create
2. git push heroku master
3. heroku rake ar:migrate
4. heroku rake seed
5. heroku config:set session_secret=xxxxxx
