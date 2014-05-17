class RootViewController < UIViewController
  CELL_IDENTIFIER = 'cell'
  def viewDidLoad
    self.title = "Compare Maps"
    @data = [
      'Native (MapKit)',
      'WebView (HTML5)'
    ]
    @tableView = UITableView.alloc.initWithFrame(
      [[0, 0], [self.view.frame.size.width, self.view.frame.size.height]],
      style: UITableViewStylePlain
    )
    @tableView.dataSource = self
    @tableView.delegate = self
    view.addSubview(@tableView)
    super
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELL_IDENTIFIER) ||
           UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault,
                              reuseIdentifier: CELL_IDENTIFIER)
    cell.textLabel.text = @data[indexPath.row]
    return cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    if indexPath.row == 0
      view_controller = NativeMapViewController.alloc.init
    else
      view_controller = WebviewMapViewController.alloc.init
    end
    tableView.deselectRowAtIndexPath(indexPath, animated:true)
    self.parentViewController.pushViewController(view_controller, animated: false)
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @data.count
  end
end
