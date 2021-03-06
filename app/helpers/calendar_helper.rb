module CalendarHelper
  def calendar(date = Date.today, block_times = nil, &block)
    Calendar.new(self, date, block_times, block).table
  end

  class Calendar < Struct.new(:view, :date, :block_times, :callback)
    HEADER = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
    START_DAY = :Sunday

    delegate :content_tag, to: :view

    def table
      content_tag :table, class: "calendar table table-responsive table-bordered" do
        header + week_rows
      end
    end

    def header
      content_tag :tr do
        HEADER.map { |day| content_tag :th, day.first(3) }.join.html_safe
      end
    end

    def week_rows
      weeks.map do |week|
        content_tag :tr do
          week.map { |day| day_cell(day) }.join.html_safe
        end
      end.join.html_safe
    end

    def day_cell(day)
      content_tag :td, view.capture(day, &callback), class: day_classes(day)
    end

    def day_classes(day)
      block_times_for_day = block_times[day.to_date]
      classes = []
      if block_times_for_day
        classes << "hasblocks" if block_times_for_day
        classes << "reserved_day" if block_times_for_day.any? { |bt| bt.all_day? }
      end
      classes << "today" if day == Date.today
      classes << "notmonth" if day.month != date.month
      classes.empty? ? nil : classes.join(" ")
    end

    def weeks
      first = date.beginning_of_month.beginning_of_week
      last = date.end_of_month.end_of_week
      (first..last).to_a.in_groups_of(7)
    end


  end
end









