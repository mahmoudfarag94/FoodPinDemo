import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    //var restaurant:RestaurantMO!
     var restaurant:RestauranteModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMap()
        mapView.showsScale = true
        mapView.showsCompass = true
        mapView.showsTraffic = true
        // Do any additional setup after loading the view.
    }

    
    func loadMap()  {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(restaurant.location!, completionHandler: {
            placemarks , error in
            if error != nil{
                print("this my error ok ....\(error?.localizedDescription)")
                return
            }
            if let placemarks = placemarks{
                let placemark = placemarks[0]
                
                let annotion  = MKPointAnnotation()
                annotion.title = self.restaurant.name
                annotion.subtitle = self.restaurant.type
                if let loc = placemark.location{
                    annotion.coordinate = loc.coordinate
                   // self.mapView.showAnnotations([annotion], animated: true)
                  //  self.mapView.selectAnnotation(annotion, animated: true)
                    //self.mapView.addAnnotation(annotion)
                    
                }
                
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
