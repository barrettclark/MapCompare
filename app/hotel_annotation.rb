class HotelAnnotation
  HOTELS = [
    {:name => 'Hotel Zetta', :latitude => 37.783499, :longitude => -122.407241},
    {:name => 'Hotel Palomar', :latitude => 37.784990, :longitude => -122.405677},
    {:name => 'Hotel Nikko', :latitude => 37.786067, :longitude => -122.409252},
    {:name => 'Four Seasons', :latitude => 37.786550, :longitude => -122.404510},
    {:name => 'W Hotel', :latitude => 37.785357, :longitude => -122.400421},
    {:name => 'Le Meridien', :latitude => 37.794729, :longitude => -122.400507},
    {:name => 'Omni', :latitude => 37.793003, :longitude => -122.403072}
  ]

  def initialize(params)
    @name = params[:name]
    @coordinate = CLLocationCoordinate2D.new(params[:latitude], params[:longitude])
  end

  def title
    @name
  end

  def coordinate
    @coordinate
  end
end

__END__

centroid calculated using RGeo

factory = RGeo::Cartesian.factory
coordinates = [
  [-122.407241, 37.783499],
  [-122.405677, 37.784990],
  [-122.409252, 37.786067],
  [-122.404510, 37.786550],
  [-122.400421, 37.785357],
  [-122.400507, 37.794729],
  [-122.403072, 37.793003]
]
points = coordinates.map { |lng, lat| factory.point(lng, lat) }
points << points.first  # this makes it a closed polygon rather than a line
line_string = factory.line_string(points)
polygon = factory.polygon(line_string)
polygon.centroid
# -122.40222926976418 37.78951696825853
