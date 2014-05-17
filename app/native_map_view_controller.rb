class NativeMapViewController < UIViewController
  def viewDidLoad
    self.title = 'Native Map'
    self.view = MKMapView.alloc.init
    view.delegate = self
    super
  end

  def viewWillAppear(animated)
    # zoomLocation = CLLocationCoordinate2D.new(39.281516, -76.580806)
    zoomLocation           = CLLocationCoordinate2D.new
    zoomLocation.latitude  = self.view.userLocation.coordinate.latitude
    zoomLocation.longitude = self.view.userLocation.coordinate.longitude
    region = MKCoordinateRegionMakeWithDistance(zoomLocation, 1600, 1600)
    self.view.setRegion(region)
    HotelAnnotation::HOTELS.each { |hotel| self.view.addAnnotation(HotelAnnotation.new(hotel)) }
  end
end
