This Time Service module operates on a time that is initialized in the given format: [H]H:MM {AM|PM}.

This can be used to add minutes to the time and be returned a string with the new updated time.

This module can be used in a manner similar to the following format:
time = TimeService::Service.new('9:13 AM')
time.add_minutes 10 # => returns "09:23 AM"

Or a block can be passed in:

TimeService::Service.new('9:13 AM', 10) do |time|
  p time # => "09:23 AM"
end

If I were to iterate on this solution, I would add functionality for both class and instance methods. This provides more functionality so a user can continue adding time to an initial time (ex: time = 9:00 AM...time.add_minutes(10)...time.add_minutes(10) yields 9:20 AM) or simply do time arithmetic over and over. Given more time and allowed to use gems/libraries I would add specs to the file and Guard to automate testing and devlop in TDD. I would also think deeper into the two classes. Possibly revisit which class inherits from the other and any other use cases for these classes that may change up their structure, functionality, etc.
