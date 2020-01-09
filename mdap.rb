# -*- coding:utf-8 -*-
require 'time'


def mdap(n, desc:nil, bar_shape:["\e[42m \e[0m", "─"],
         datetime_format:"%M:%S", indicator:"⠟⠿⠻⠾⠿⠷"
        )
  ## -----*----- Progress Bar -----*----- ##
  dt_start = Time.new

  1.upto(n) do |i|
    width = `tput cols`.to_i
    dt_now = Time.new

    # 出力フォーマット
    out_str = sprintf("[] %c%d%% (%d/%d) [%s-%s %fit/s]",
                      indicator[i%indicator.length], i*100/n, i, n,
                      dt_start.strftime(datetime_format),
                      dt_now.strftime(datetime_format),
                      i / (dt_now-dt_start)
                     )
    out_str = "#{desc}: #{out_str}"  unless desc.nil?

    # 進捗バー
    bar_len = width-out_str.length
    bar = (1..bar_len).map { |j|
      if i/n.to_f >= j/bar_len.to_f
        bar_shape[0]
      else
        bar_shape[1]
      end
    }.join

    # 表示
    print "\r#{out_str.gsub('[]', "[#{bar}]")}"

    yield
  end
end
