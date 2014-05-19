class NativeMapViewController < UIViewController
  def viewDidLoad
    self.title = 'Native Map'
    self.view = MKMapView.alloc.init
    view.delegate = self
    super
  end

  def viewWillAppear(animated)
    zoomLocation = CLLocationCoordinate2D.new(37.78951696825853, -122.40222926976418)
    region = MKCoordinateRegionMakeWithDistance(zoomLocation, 1600, 1600)
    self.view.setRegion(region)
    HotelAnnotation::HOTELS.each { |hotel| self.view.addAnnotation(HotelAnnotation.new(hotel)) }
  end
end
