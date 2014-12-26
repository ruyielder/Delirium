require 'spec_helper'

describe ApplicationHelper do
  include ApplicationHelper

  describe 'HumanizedTimeDifference' do
    def between(start_time, end_time)
      ApplicationHelper::HumanizedTimeDifference.between(start_time, end_time).to_s
    end

    it 'can humanize `teraz`' do
      start_time = Time.new(2014, 11, 12, 8, 0, 0)
      end_time = start_time
      expect(between(start_time, end_time)).to eq 'teraz'
    end

    it 'can humanize `sekundę temu`' do
      start_time = Time.new(2014, 11, 12, 8, 0, 0)
      end_time = Time.new(2014, 11, 12, 8, 0, 1)
      expect(between(start_time, end_time)).to eq 'sekundę temu'
    end

    it 'can humanize `2 sekundy temu`' do
      start_time = Time.new(2014, 11, 12, 8, 0, 0)
      end_time = Time.new(2014, 11, 12, 8, 0, 2)
      expect(between(start_time, end_time)).to eq '2 sekundy temu'
    end

    it 'can humanize `3 sekundy temu`' do
      start_time = Time.new(2014, 11, 12, 8, 0, 0)
      end_time = Time.new(2014, 11, 12, 8, 0, 3)
      expect(between(start_time, end_time)).to eq '3 sekundy temu'
    end

    it 'can humanize `4 sekundy temu`' do
      start_time = Time.new(2014, 11, 12, 8, 0, 0)
      end_time = Time.new(2014, 11, 12, 8, 0, 4)
      expect(between(start_time, end_time)).to eq '4 sekundy temu'
    end

    it 'can humanize `5 sekund temu`' do
      start_time = Time.new(2014, 11, 12, 8, 0, 0)
      end_time = Time.new(2014, 11, 12, 8, 0, 5)
      expect(between(start_time, end_time)).to eq '5 sekund temu'
    end

    it 'can humanize `21 sekund temu`' do
      start_time = Time.new(2014, 11, 12, 8, 0, 0)
      end_time = Time.new(2014, 11, 12, 8, 0, 21)
      expect(between(start_time, end_time)).to eq '21 sekund temu'
    end

    it 'can humanize `minutę temu`' do
      start_time = Time.new(2014, 11, 12, 8, 0, 0)
      end_time = Time.new(2014, 11, 12, 8, 1, 1)
      expect(between(start_time, end_time)).to eq 'minutę temu'
    end

    it 'can humanize `2 minuty temu`' do
      start_time = Time.new(2014, 11, 12, 8, 0, 0)
      end_time = Time.new(2014, 11, 12, 8, 2, 2)
      expect(between(start_time, end_time)).to eq '2 minuty temu'
    end

    it 'can humanize `3 minuty temu`' do
      start_time = Time.new(2014, 11, 12, 8, 0, 0)
      end_time = Time.new(2014, 11, 12, 8, 3, 3)
      expect(between(start_time, end_time)).to eq '3 minuty temu'
    end

    it 'can humanize `4 minuty temu`' do
      start_time = Time.new(2014, 11, 12, 8, 0, 0)
      end_time = Time.new(2014, 11, 12, 8, 4, 4)
      expect(between(start_time, end_time)).to eq '4 minuty temu'
    end

    it 'can humanize `5 minut temu`' do
      start_time = Time.new(2014, 11, 12, 8, 0, 0)
      end_time = Time.new(2014, 11, 12, 8, 5, 5)
      expect(between(start_time, end_time)).to eq '5 minut temu'
    end

    it 'can humanize `21 minut temu`' do
      start_time = Time.new(2014, 11, 12, 8, 0, 0)
      end_time = Time.new(2014, 11, 12, 8, 21, 21)
      expect(between(start_time, end_time)).to eq '21 minut temu'
    end

    it 'can humanize `godzinę temu`' do
      start_time = Time.new(2014, 11, 12, 8, 0, 0)
      end_time = Time.new(2014, 11, 12, 9, 1, 1)
      expect(between(start_time, end_time)).to eq 'godzinę temu'
    end

    it 'can humanize `2 godziny temu`' do
      start_time = Time.new(2014, 11, 12, 8, 0, 0)
      end_time = Time.new(2014, 11, 12, 10, 2, 2)
      expect(between(start_time, end_time)).to eq '2 godziny temu'
    end

    it 'can humanize `3 godziny temu`' do
      start_time = Time.new(2014, 11, 12, 8, 0, 0)
      end_time = Time.new(2014, 11, 12, 11, 3, 3)
      expect(between(start_time, end_time)).to eq '3 godziny temu'
    end

    it 'can humanize `4 godziny temu`' do
      start_time = Time.new(2014, 11, 12, 8, 0, 0)
      end_time = Time.new(2014, 11, 12, 12, 4, 4)
      expect(between(start_time, end_time)).to eq '4 godziny temu'
    end

    it 'can humanize `5 godzin temu`' do
      start_time = Time.new(2014, 11, 12, 8, 0, 0)
      end_time = Time.new(2014, 11, 12, 13, 5, 5)
      expect(between(start_time, end_time)).to eq '5 godzin temu'
    end

    it 'can humanize `21 godzin temu`' do
      start_time = Time.new(2014, 11, 12, 0, 0, 0)
      end_time = Time.new(2014, 11, 12, 21, 21, 21)
      expect(between(start_time, end_time)).to eq '21 godzin temu'
    end

    it 'can humanize `tydzień temu`' do
      start_time = Time.new(2014, 11, 1, 8, 0, 0)
      end_time = Time.new(2014, 11, 8, 9, 1, 1)
      expect(between(start_time, end_time)).to eq 'tydzień temu'
    end

    it 'can humanize `2 tygodnie temu`' do
      start_time = Time.new(2014, 11, 1, 8, 0, 0)
      end_time = Time.new(2014, 11, 15, 10, 2, 2)
      expect(between(start_time, end_time)).to eq '2 tygodnie temu'
    end

    it 'can humanize `3 tygodnie temu`' do
      start_time = Time.new(2014, 11, 1, 8, 0, 0)
      end_time = Time.new(2014, 11, 22, 11, 3, 3)
      expect(between(start_time, end_time)).to eq '3 tygodnie temu'
    end

    it 'can humanize `4 tygodnie temu`' do
      start_time = Time.new(2014, 11, 1, 8, 0, 0)
      end_time = Time.new(2014, 11, 29, 11, 3, 3)
      expect(between(start_time, end_time)).to eq '4 tygodnie temu'
    end

    it 'can humanize `miesiąc temu`' do
      start_time = Time.new(2014, 1, 1, 8, 0, 0)
      end_time = Time.new(2014, 2, 8, 9, 1, 1)
      expect(between(start_time, end_time)).to eq 'miesiąc temu'
    end

    it 'can humanize `2 miesiące temu`' do
      start_time = Time.new(2014, 1, 1, 8, 0, 0)
      end_time = Time.new(2014, 3, 15, 10, 2, 2)
      expect(between(start_time, end_time)).to eq '2 miesiące temu'
    end

    it 'can humanize `3 miesiące temu`' do
      start_time = Time.new(2014, 1, 1, 8, 0, 0)
      end_time = Time.new(2014, 4, 22, 11, 3, 3)
      expect(between(start_time, end_time)).to eq '3 miesiące temu'
    end

    it 'can humanize `4 miesiące temu`' do
      start_time = Time.new(2014, 1, 1, 8, 0, 0)
      end_time = Time.new(2014, 5, 29, 11, 3, 3)
      expect(between(start_time, end_time)).to eq '4 miesiące temu'
    end

    it 'can humanize `5 miesięcy temu`' do
      start_time = Time.new(2014, 1, 1, 8, 0, 0)
      end_time = Time.new(2014, 6, 29, 11, 3, 3)
      expect(between(start_time, end_time)).to eq '5 miesiący temu'
    end

    it 'can humanize `10 miesięcy temu`' do
      start_time = Time.new(2014, 1, 1, 8, 0, 0)
      end_time = Time.new(2014, 11, 29, 11, 3, 3)
      expect(between(start_time, end_time)).to eq '10 miesiący temu'
    end

    it 'can humanize `rok temu`' do
      start_time = Time.new(2013, 1, 1, 8, 0, 0)
      end_time = Time.new(2014, 2, 8, 9, 1, 1)
      expect(between(start_time, end_time)).to eq 'rok temu'
    end

    it 'can humanize `2 lata temu`' do
      start_time = Time.new(2012, 1, 1, 8, 0, 0)
      end_time = Time.new(2014, 3, 15, 10, 2, 2)
      expect(between(start_time, end_time)).to eq '2 lata temu'
    end

    it 'can humanize `3 lata temu`' do
      start_time = Time.new(2011, 1, 1, 8, 0, 0)
      end_time = Time.new(2014, 4, 22, 11, 3, 3)
      expect(between(start_time, end_time)).to eq '3 lata temu'
    end

    it 'can humanize `4 lata temu`' do
      start_time = Time.new(2010, 1, 1, 8, 0, 0)
      end_time = Time.new(2014, 5, 29, 11, 3, 3)
      expect(between(start_time, end_time)).to eq '4 lata temu'
    end

    it 'can humanize `5 lat temu`' do
      start_time = Time.new(2009, 1, 1, 8, 0, 0)
      end_time = Time.new(2014, 6, 29, 11, 3, 3)
      expect(between(start_time, end_time)).to eq '5 lat temu'
    end

    it 'can humanize `10 lat temu`' do
      start_time = Time.new(2004, 1, 1, 8, 0, 0)
      end_time = Time.new(2014, 11, 29, 11, 3, 3)
      expect(between(start_time, end_time)).to eq '10 lat temu'
    end
  end
end
