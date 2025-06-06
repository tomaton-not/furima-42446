#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile

# 本番DBを初期化する（テストデータのみの状態を前提）
bundle exec rails db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1
bundle exec rails db:create
bundle exec rails db:migrate
