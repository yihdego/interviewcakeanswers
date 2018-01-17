sample = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]

two_ranges = [[1,3],[2,4]]

def one_pair(input)
  sorted = input.sort
  output = sorted.shift
  if input[0].min < input[1].min
    a = input[0]
    b = input[1]
  else
    a = input[1]
    b = input[0]
  end
  if b.min > a.min && b.min < a.max
    if b.max > a.max
      output = [a.min, b.max]
    else
      output = [a.min, b.max]
    end
  end
  p output
end

one_pair(two_ranges)

def merge_ranges(meetings)

# sort by start time
sorted_meetings = meetings.sort

# initialize merged_meetings with the earliest meeting
merged_meetings = [sorted_meetings[0]]

sorted_meetings[1..-1].each do |current_meeting_start, current_meeting_end|

  last_merged_meeting_start, last_merged_meeting_end = merged_meetings[-1]

  # if the current and last meetings overlap, use the latest end time
  if current_meeting_start <= last_merged_meeting_end
    merged_meetings[-1] = [last_merged_meeting_start, [last_merged_meeting_end, current_meeting_end].max]

  # add the current meeting since it doesn't overlap
  else
    merged_meetings.push([current_meeting_start, current_meeting_end])
  end
end

p merged_meetings
end

merge_ranges(sample)
