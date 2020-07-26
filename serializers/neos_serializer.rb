class NeosSerializer
  def daily(response)
    neos = []
    response[:near_earth_objects].first[1].each do |neo|
      neos << {
        id: neo[:id],
        name: neo[:name],
        relative_velocity: neo[:close_approach_data][0][:relative_velocity][:miles_per_hour],
        lunar_distance: neo[:close_approach_data][0][:miss_distance][:lunar]
      }
    end
    neos.sort_by! { |neo| neo[:lunar_distance].to_f }[0..3]
  end
end
