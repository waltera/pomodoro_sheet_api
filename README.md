[![CircleCI](https://circleci.com/gh/waltera/pomodoro_sheet_api.svg?style=svg)](https://circleci.com/gh/waltera/pomodoro_sheet_api)

# Pomodoro Sheet API

API to register units of work inspired on pomodoro technique.

# Config dev environment

```sh
docker-compose build
dockser-compose run web bundle install
docker-compose run web rake db:create db:migrate db:seed
```

<sub>This application does not affiliated, associated or financed by Pomodoro Technique® or Francesco Cirillo.
Pomodoro Technique® and Pomodoro™ they are registered trademarks by Francesco Cirillo.</sub>
