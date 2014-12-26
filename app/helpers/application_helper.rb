require 'time_difference'

module ApplicationHelper
  class HumanizedTimeDifference

    def self.between(start_time, end_time)
      humanize TimeDifference.between(start_time, end_time)
    end

    private

    def self.humanize(difference)
      years = difference.in_years.to_i
      return humanize_years_ago(years) if years > 0

      months = difference.in_months.to_i
      return humanize_months_ago(months) if months > 0

      weeks = difference.in_weeks.to_i
      return humanize_weeks_ago(weeks) if weeks > 0

      days = difference.in_days.to_i
      return humanize_days_ago(days) if days > 0

      hours = difference.in_hours.to_i
      return humanize_hours_ago(hours) if hours > 0

      minutes = difference.in_minutes.to_i
      return humanize_minutes_ago(minutes) if minutes > 0

      humanize_seconds_ago(difference.in_seconds.to_i)
    end

    def self.humanize_years_ago(years)
      if years == 1
        'rok temu'
      elsif [2, 3, 4].include? years
        "#{years} lata temu"
      else
        "#{years} lat temu"
      end
    end

    def self.humanize_months_ago(months)
      if months == 1
        'miesiąc temu'
      elsif [2, 3, 4].include? months
        "#{months} miesiące temu"
      else
        "#{months} miesiący temu"
      end
    end

    def self.humanize_weeks_ago(weeks)
      if weeks == 1
        'tydzień temu'
      else
        "#{weeks} tygodnie temu"
      end
    end

    def self.humanize_days_ago(days)
      if days == 1
        'dzień temu'
      else
        "#{days} dni temu"
      end
    end

    def self.humanize_hours_ago(hours)
      if hours == 1
        'godzinę temu'
      elsif [2, 3, 4].include? hours
        "#{hours} godziny temu"
      else
        "#{hours} godzin temu"
      end
    end

    def self.humanize_minutes_ago(minutes)
      if minutes == 1
        'minutę temu'
      elsif [2, 3, 4].include? minutes
        "#{minutes} minuty temu"
      else
        "#{minutes} minut temu"
      end
    end

    def self.humanize_seconds_ago(seconds)
      if seconds == 0
        'teraz'
      elsif seconds == 1
        'sekundę temu'
      elsif [2, 3, 4].include? seconds
        "#{seconds} sekundy temu"
      else
        "#{seconds} sekund temu"
      end
    end
  end
end
