class WebviewMapViewController < UIViewController
  def viewDidLoad
    self.title = 'HTML5 Map'
    self.view = UIWebView.alloc.init
    path = NSBundle.mainBundle.pathForResource('map', ofType: 'html')
    url = NSURL.fileURLWithPath(path)
    request = NSURLRequest.requestWithURL(url)
    self.view.loadRequest request
    super
  end
end
