# -*- coding:utf-8 -*-
require 'time'


def mdap(n, datetime_format:"%H:%M:%S.%L",
         bar_shape:["\e[42m \e[0m", "."]
        )
  ## -----*----- Progress Bar -----*----- ##
  # 初期時刻
  dt_start = Time.new.strftime(datetime_format)

  1.upto(n) do |i|
    # ウィンドウ幅
    width = `tput cols`.to_i
    # 現在時刻
    dt_now = Time.new.strftime(datetime_format)

    # 出力フォーマット
    out_str = sprintf("[] %d%s (%d/%d) [%s-%s]", i*100/n, '%', i, n, dt_start, dt_now)
    #out_str = "[] #{i*100/n}% (#{i}/#{n}) [#{dt_start}-#{dt_now}]"
    bar_len = width-out_str.length
    bar = (1..bar_len).map { |j|
      if i/n.to_f >= j/bar_len.to_f
        bar_shape[0]
      else
        bar_shape[1]
      end
    }.join
    print "\r#{out_str.gsub('[]', "[#{bar}]")}"
    yield
  end
end

mdap(1000) { sleep 0.01 }
