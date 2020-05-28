class AppointmentDate
    include ActiveModel::Serialization
    include ActiveModel::Model

    attr_accessor :start_time

    def initialize(start_time)
        self.start_time = start_time
    end

    def day
        start_time.day
    end

    def month
        start_time.month
    end

    def year
        start_time.year
    end
end