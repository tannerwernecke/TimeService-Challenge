module TimeService
	class TimeFunctions
		attr_accessor :hours, :minutes, :meridiem

		def total_minutes(hours, minutes, meridiem, minutes_to_add)
			hours += 12 if meridiem == "PM"
			minutes += minutes_to_add
			((hours * 60) + minutes) % (24 * 60) # We don't care about time that's more than one day
		end
	
		def hours_from_total_minutes(total_minutes)
			total_minutes / 60
		end

		def minutes_from_total_minutes(total_minutes)
			total_minutes % 60
		end

		def calculate_meridiem(hours)
			hours > 12 ? "PM" : "AM"
		end
	end

	class Time < TimeFunctions
		def initialize(time_value, minutes_to_add = 0)
			hours_and_minutes = time_value.split(" ")[0]
			@hours = hours_and_minutes.split(":")[0].to_i
			@minutes = hours_and_minutes.split(":")[1].to_i
			@meridiem = time_value.split(" ")[1]

			yield add_minutes(minutes_to_add) if block_given?
		end

		def add_minutes(minutes_to_add)
			total_minutes = total_minutes(@hours, @minutes, @meridiem, minutes_to_add)
			@hours = hours_from_total_minutes(total_minutes)
			@minutes = minutes_from_total_minutes(total_minutes)
			@meridiem = calculate_meridiem(@hours)
	
			@hours -= 12 if meridiem == "PM"

			"#{@hours}:%02d #{@meridiem}" % [@minutes]
		end
	end
end
