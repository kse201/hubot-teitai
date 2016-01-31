# Description
#   meeting reminder
#
# Configuration:
#   None
#
# Author:
#   kse201 <kse.201@gmail.com>
#

cronJob = require('cron').CronJob
random = require('hubot').Response::random

rppm = process.env.HUBOT_TEITAI_ROOM
cron_timer = process.env.HUBOT_TEITAI_TIME
timezone = process.env.HUBOT_TEITAI_TIMEZONE

module.exports = (robot) ->
    task1 = new cronJob({
        cronTime: cron_timer,
        onTick: () ->
            robot.send {room: room}, "定時の時間になりました。" + random ([
              '残業のし過ぎは生産効率の低下を招きます。'
              '毎日遅くまでご苦労様です。今日ぐらいは早く帰ってもいいんじゃないですか。'
              '今日は用事があるのでお先に失礼してします。'
              '早く帰ってゆっくりお風呂に入れば疲れもとれますよ。'
              'ここは俺に任せてお前らは早く逃げろ。'
              '残業をするのは能力が低い証拠だ。'
              ])
        start: true,
        timeZone: timezone
    })
