class ScheduleSetting < ApplicationRecord
	belongs_to :nanny

	DAYNAMES = ["星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"]
end
