import UIKit
import CoreData
import UserNotifications

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , NSFetchedResultsControllerDelegate  , UISearchResultsUpdating {
   
    @IBOutlet weak var restTableView: UITableView!
    var rest:RestauranteModel!
  //  var restaurants:[RestaurantMO] = []
    var searchController:UISearchController!
    var searchResult:[RestauranteModel] = []
    var restaurants:[RestauranteModel] = [
        RestauranteModel(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F,72 Po Hing Fong, Sheung Wan, Hong Kong", phone: "232-923423", image:"cafedeadend.jpg", isVisited: false),
        RestauranteModel(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A TaiPing San Street SOHO, Sheung Wan, Hong Kong", phone: "348-233423", image:"homei.jpg", isVisited: false),
        RestauranteModel(name: "Teakha", type: "Tea House", location: "Shop B, 18 TaiPing Shan Road SOHO, Sheung Wan, Hong Kong", phone: "354-243523", image:"teakha.jpg", isVisited: false),
        RestauranteModel(name: "Cafe loisl", type: "Austrian / Causual Drink", location:"Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "453-333423", image: "cafeloisl.jpg", isVisited: false),
        RestauranteModel(name: "Petite Oyster", type: "French", location: "24 Tai PingShan Road SOHO, Sheung Wan, Hong Kong", phone: "983-284334", image:"petiteoyster.jpg", isVisited: false),
        RestauranteModel(name: "For Kee Restaurant", type: "Bakery", location: "Shop JK., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong", phone: "232-434222",image: "forkeerestaurant.jpg", isVisited: false),
        RestauranteModel(name: "Po's Atelier", type: "Bakery", location: "G/F, 62 Po HingFong, Sheung Wan, Hong Kong",phone: "234-834322", image: "posatelier.jpg",isVisited: false),
        RestauranteModel(name: "Bourke Street Backery", type: "Chocolate", location: "633Bourke St Sydney New South Wales 2010 Surry Hills", phone: "982-434343", image:"bourkestreetbakery.jpg", isVisited: false),
        RestauranteModel(name: "Haigh's Chocolate", type: "Cafe", location: "412-414George St Sydney New South Wales", phone: "734-232323", image:"haighschocolate.jpg", isVisited: false),
        RestauranteModel(name: "Palomino Espresso", type: "American / Seafood", location:"Shop 1 61 York St Sydney New South Wales", phone: "872-734343", image:"palominoespresso.jpg", isVisited: false),
        RestauranteModel(name: "Upstate", type: "American", location: "95 1st Ave NewYork, NY 10003", phone: "343-233221", image: "upstate.jpg", isVisited: false),
        RestauranteModel(name: "Traif", type: "American", location: "229 S 4th StBrooklyn, NY 11211", phone: "985-723623", image: "traif.jpg", isVisited:false),
        RestauranteModel(name: "Graham Avenue Meats", type: "Breakfast & Brunch",location: "445 Graham Ave Brooklyn, NY 11211", phone: "455-232345", image:"grahamavenuemeats.jpg", isVisited: false),
        RestauranteModel(name: "Waffle & Wolf", type: "Coffee & Tea", location: "413Graham Ave Brooklyn, NY 11211", phone: "434-232322", image: "wafflewolf.jpg",isVisited: false),
        RestauranteModel(name: "Five Leaves", type: "Coffee & Tea", location: "18 BedfordAve Brooklyn, NY 11222", phone: "343-234553", image: "fiveleaves.jpg",isVisited: false),
        RestauranteModel(name: "Cafe Lore", type: "Latin American", location: "SunsetPark 4601 4th Ave Brooklyn, NY 11220", phone: "342-455433", image:"cafelore.jpg", isVisited: false),
        RestauranteModel(name: "Confessional", type: "Spanish", location: "308 E 6th StNew York, NY 10003", phone: "643-332323", image: "confessional.jpg", isVisited:false),
        RestauranteModel(name: "Barrafina", type: "Spanish", location: "54 Frith StreetLondon W1D 4SL United Kingdom", phone: "542-343434", image: "barrafina.jpg",isVisited: false),
        RestauranteModel(name: "Donostia", type: "Spanish", location: "10 Seymour PlaceLondon W1H 7ND United Kingdom", phone: "722-232323", image: "donostia.jpg",isVisited: false),
        RestauranteModel(name: "Royal Oak", type: "British", location: "2 Regency StreetLondon SW1P 4BZ United Kingdom", phone: "343-988834", image: "royaloak.jpg",isVisited: false),
        RestauranteModel(name: "CASK Pub and Kitchen", type: "Thai", location: "22Charlwood Street London SW1V 2DY Pimlico", phone: "432-344050", image:"caskpubkitchen.jpg", isVisited: false)]
 
//    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh'sChocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional","Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
//    var restaurantImage = ["barrafina","bourkestreetbakery" ,"cafedeadend" ,"cafeloisl","cafelore","caskpubkitchen","confessional","donostia","fiveleaves","forkeerestaurant",    "grahamavenuemeats","haighschocolate","homei","palominoespresso","petiteoyster","posatelier","royaloak" ,"teakha" ,"traif" ,"upstate" ,"wafflewolf" ]
//     var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong","Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "NewYork", "New York", "New York", "New York", "New York", "New York", "New York","London", "London", "London", "London"]
//     var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "AmericanSeafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
//    var restaurantStause = Array(repeating: false, count: 21)
    override func viewDidLoad() {
        super.viewDidLoad()
        restTableView.dataSource = self
        restTableView.delegate = self
        restTableView.tableFooterView = UIView(frame:CGRect.zero)
        restTableView.separatorColor = UIColor(hue: 240.0/255.0, saturation: 240.0/255.0, brightness: 240.0/255.0, alpha: 0.8)
        //restTableView.estimatedRowHeight = 150.0
       // restTableView.rowHeight = UITableViewAutomaticDimension
        // to remove title of back button from navegation
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        searchBar()
        
//        let req:NSFetchRequest<RestaurantMO> = RestaurantMO.fetchRequest()
//        let sort = NSSortDescriptor(key: "name", ascending: true)
//        req.sortDescriptors = [sort]
//        let reqController = NSFetchedResultsController(fetchRequest: req, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
//        reqController.delegate  = self
//
//        do {
//            try reqController.performFetch()
//         if let  fetchobj  = reqController.fetchedObjects{
//                restaurants = fetchobj
//            }
//        }catch{
//            print("error")
//        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func searchBar(){
        searchController = UISearchController(searchResultsController: nil)
        searchController!.searchResultsUpdater = self as! UISearchResultsUpdating
        restTableView.tableHeaderView = searchController!.searchBar
    }
    func filterContent(for searchText:String)  {
        searchResult = restaurants.filter({(rest) ->Bool in
            if let name = rest.name{
                let match = name.localizedCaseInsensitiveContains(searchText)
                return match
            }
            return false
        })
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text{
        filterContent(for: text)
        restTableView.reloadData()
     }
    }
    
//    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        restTableView.beginUpdates()
//    }
//    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
//        switch type {
//        case .insert:
//            if let newIndex = newIndexPath{
//                restTableView.insertRows(at: [newIndexPath!], with: .fade)
//            }
//        case .delete:
//            if let indexPath = indexPath{
//                restTableView.deleteRows(at: [indexPath], with: .fade)
//            }
//        case .update:
//            if let indexPath = indexPath{
//                restTableView.reloadRows(at: [indexPath], with: .fade)
//            }
//        default:
//            restTableView.reloadData()
//        }
//        if let fecthobj = controller.fetchedObjects{
//
//            // restaurants = fecthobj as! [RestaurantMO]
//        }
//    }
//    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        restTableView.endUpdates()
//    }
//
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
        
//        let requste:NSFetchRequest<RestaurantMO> = RestaurantMO.fetchRequest()
//
//        do {
//            restaurants =  try context.fetch(requste)
//
//        } catch  {
//            print("error")
//        }
    }
    override func viewDidAppear(_ animated: Bool) {
      /*  if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "walkthroughcontroller")as? WalkThroughPageViewController{
            present(pageViewController, animated: true, completion: nil)
        }*/
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController?.isActive == true  {
            return searchResult.count
        }else{
             return restaurants.count
        }
       
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "resturantCell", for: indexPath) as! RestaurantTableViewCell
        cell.restNameLabel.text = restaurants[indexPath.row].name
        
       // cell.restImageView.image = UIImage(data:restaurants[indexPath.row].image as! Data)
        cell.restImageView.image = UIImage(named:restaurants[indexPath.row].image!)
        cell.restLocationLabel.text = restaurants[indexPath.row].location
        cell.restTypelabel.text = restaurants[indexPath.row].type
        
        if restaurants[indexPath.row].isVisited{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let callActionHandeler = {(action : UIAlertAction!)-> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailabel", message: " Sorry , the call feature is not avaliable yet . please retry later. ", preferredStyle: .actionSheet)
//            let actionMessage = UIAlertAction(title: "OK", style: .default, handler: nil)
//            alertMessage.addAction(actionMessage)
//            self.present(alertMessage, animated: true, completion: nil)
//        }
//
//        let actionSheet = UIAlertController(title: nil , message: " What Do You Want To Do ", preferredStyle: .actionSheet)
//        let callAction = UIAlertAction(title: "Call " +  " +123-000- \(indexPath.row) " , style: .default, handler: callActionHandeler)
//        let cancelAction = UIAlertAction(title: "Cancel", style:.cancel , handler: nil)
//
//        actionSheet.addAction(cancelAction)
//        actionSheet.addAction(callAction)
//
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            let uncheckAction = UIAlertAction(title: "Undo Check in ", style: .default, handler: {(action:UIAlertAction)->Void in
//                let uncheckcell = tableView.cellForRow(at: indexPath)
//                uncheckcell?.accessoryType = .none
//            })
//            actionSheet.addAction(uncheckAction)
//        }else{
//            let checkInAction = UIAlertAction(title: "Check in ", style: .default, handler: {(action:UIAlertAction)->Void in
//                let cell =  tableView.cellForRow(at: indexPath)
//                cell?.accessoryType = .checkmark
//                self.restaurantStause[indexPath.row] = true
//            })
//            actionSheet.addAction(checkInAction)
//        }
//        self.present(actionSheet, animated: true, completion: nil)
//        tableView.deselectRow(at: indexPath, animated: false)
//
//    }
//  /*  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if (editingStyle == .delete){
//            restaurantStause.remove(at: indexPath.row)
//            //restaurantImage.remove(at: indexPath.row)
//            //restaurantNames.remove(at: indexPath.row)
//            //restaurantLocations.remove(at: indexPath.row)
//           // restaurantTypes.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//        tableView.reloadData()
//    }*/
//
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
      let shareAction = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath)->Void in

        let defultText = "just checking in at " + self.restaurants[indexPath.row].name!
       // if let image = UIImage(data: self.restaurants[indexPath.row].image as! Data){
        if let image = UIImage(named: self.restaurants[indexPath.row].image!){
            let activityController = UIActivityViewController(activityItems: [defultText , image], applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
        }

        }
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: {(action , indexPath)->Void in
            self.restaurants.remove(at: indexPath.row)
//            self.restaurants.remove(at: indexPath.row)
//            self.restaurants.remove(at: indexPath.row)
//            self.restaurants.remove(at: indexPath.row)
//            self.restaurants.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        })

        shareAction.backgroundColor = UIColor(displayP3Red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(displayP3Red: 202.0/255.0, green: 202.0/255.0, blue: 103.0/255.0, alpha: 1.0)
        return [ deleteAction , shareAction]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail"{
            if let indexPath = self.restTableView.indexPathForSelectedRow{
                let destenation = segue.destination as!RestaurantDetailViewController

                if searchController.isActive == true {
                destenation.restaurant = searchResult[indexPath.row]
                    }else{
                    destenation.restaurant = restaurants[indexPath.row]
                }
                
            }
        }
    }
    /*func prepareNotification(){
        if restaurants.count<=0{
            return
        }
        let  random =  
        let content = UNMutableNotificationContent()
        content.title = "Restaurant Recommendition"
        content.subtitle = "Try new food "
        content.body = "i recommended you to check out "
        content.sound = UNNotificationSound.default()
        let triger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let req = UNNotificationRequest(identifier: "foodpin", content: content, trigger: triger)
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
    }
    
    */
    @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue){}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
