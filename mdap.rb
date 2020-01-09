# -*- coding:utf-8 -*-
require 'time'


def mdap(n, desc:nil, bar_shape:["\e[42m \e[0m", "─"],
         indicator:"⠟⠯⠷⠿⠾⠽⠻⠿", datetime_format:"%M:%S"
        )
  ## -----*----- Progress Bar -----*----- ##
  # タイマー設定（インジケータ用）
  c_indicator = ''
  unless indicator.nil?
    Timer::set_frame_rate(500)
    index = 0

    # インジケータ文字を切り替え
    Timer::timer {
      index += 1
      c_indicator = indicator[index%indicator.length]
    }
  end

  # 起動時の日時
  dt_start = Time.new

  1.upto(n) do |i|
    width = `tput cols`.to_i
    dt_now = Time.new

    # 出力フォーマット
    out_str = sprintf("[] %s%d%% (%d/%d) [%s-%s %fit/s]",
                      c_indicator, i*100/n, i, n,
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


module Timer
  def set_frame_rate(time)
    ## -----*----- フレームレートの初期化 -----*----- ##
    @frame_rate = time
  end

  def timer(join: false, sleep: true)
    ## -----*----- タイマー設定（サブスレッド） -----*----- ##
    @th = Thread.new {
      loop do
        yield
        sleep 60.0 / @frame_rate if sleep
      end
    }
    @th.join if join
  end

  def exit
    ## -----*----- タイマー処理終了 -----*----- ##
    @th.kill
  end

  module_function :set_frame_rate, :timer, :exit
end
