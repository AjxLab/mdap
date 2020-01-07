# -*- coding:utf-8 -*-
require 'time'


def mdap(n, datetime_format:"%H:%M:%S.%L")
  ## -----*----- Progress Bar -----*----- ##
  # 初期時刻
  dt_start = Time.new.strftime(datetime_format)

  1.upto(n) do |i|
    # ウィンドウ幅
    width = `tput cols`.to_i
    # 現在時刻
    dt_now = Time.new.strftime(datetime_format)

    out_str = "\r|| #{i*100/n}% (#{i}/#{n}) [#{dt_start}-#{dt_now}]"
    bar = (1..out_str.length).map { |j|

    }
    yield
  end
end

mdap(100) { sleep 0.01 }
