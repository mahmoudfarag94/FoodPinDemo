import UIKit
import MapKit

class RestaurantDetailViewController: UIViewController  , UITableViewDataSource ,UITableViewDelegate{
   
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    @IBOutlet weak var footerMapView: MKMapView!
    //var restaurant:RestaurantMO!
   var restaurant :RestauranteModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        TableView.dataSource = self
        TableView.delegate = self
        TableView.estimatedRowHeight = 36.0
        TableView.rowHeight = UITableViewAutomaticDimension
        TableView.backgroundColor = UIColor(hue: 240.0/255.0, saturation: 240.0/255.0, brightness: 240.0/255.0, alpha: 0.2)
        //TableView.tableFooterView = UIView(frame: CGRect.zero)
        TableView.separatorColor = UIColor(hue: 240.0/255.0, saturation: 240.0/255.0, brightness: 240.0/255.0, alpha: 0.8)
        restaurantImageView.image = UIImage(named: restaurant.image! /*as!Data*/)
        title = restaurant.name
        loadMap()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    @IBAction func close(segue:UIStoryboardSegue){
    }
    @IBAction func ratingButtonTaped(segue :UIStoryboardSegue){
        if let rating  = segue.identifier {
            restaurant.isVisited = true
            switch rating {
            case "great": restaurant.rating  = "Absolutely love it! Must try."
            case "good":restaurant.rating  = "Pretty good."
            case "dislike" : restaurant.rating = "I don't like it."
            default : break
            }
        }
        TableView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showReview"{
            let dist = segue.destination as!ReviewViewController
            dist.reviewRestaurant = restaurant
        }else if segue.identifier == "showMap"{
            let dis = segue.destination as! MapViewController
            dis.restaurant = restaurant
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      let cell =  tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)as! RestaurantDetailCell
        switch indexPath.row {
        case 0:
            cell.FiledLabel.text = "Name"
            cell.ValueLabel.text = restaurant.name
        case 1:
            cell.FiledLabel.text = "Type"
            cell.ValueLabel.text = restaurant.type
        case 2:
            cell.FiledLabel.text = "Location"
            cell.ValueLabel.text = restaurant.location
        case 3 :
            cell.FiledLabel.text = "Phone"
            cell.ValueLabel.text = restaurant.phone
        case 4:
            cell.FiledLabel.text = "BeenHere"
            cell.ValueLabel.text = (restaurant.isVisited) ? " Yes , I,ve been here before  \(restaurant.rating)": "No"
        default:
            cell.FiledLabel.text = ""
            cell.ValueLabel.text = ""
        }
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    @objc func mapShow(){
    performSegue(withIdentifier: "showMap", sender: self)
    }
    func loadMap(){
        let tapGusterRecognizer =  UITapGestureRecognizer(target: self, action: #selector(mapShow))
        footerMapView.addGestureRecognizer(tapGusterRecognizer)
        let geocoder  = CLGeocoder()
        geocoder.geocodeAddressString(restaurant.location!, completionHandler: {
            placemarks ,error in
            if error != nil{
                print(error)
                return
            }
            if let placmarks = placemarks{
                let placemark = placmarks[0]
                let annotion = MKPointAnnotation()
                let loc = placemark.location
                annotion.coordinate = (loc?.coordinate)!
                self.footerMapView.addAnnotation(annotion)
                let regoin = MKCoordinateRegionMakeWithDistance(annotion.coordinate, 250, 250)
                self.footerMapView.setRegion(regoin, animated: false)
            }
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
