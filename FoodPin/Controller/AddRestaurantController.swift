import UIKit
import CoreData
class AddRestaurantController: UITableViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var staticImageview: UIImageView!
    
    @IBOutlet weak var restNameTextFeild: UITextField!
    @IBOutlet weak var restTypeTextFeild: UITextField!
    @IBOutlet weak var restLocationTextFeild: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                var imagepicker = UIImagePickerController()
                imagepicker.delegate = self
                imagepicker.allowsEditing = false
                imagepicker.sourceType = .photoLibrary
                present(imagepicker, animated: true, completion: nil)
            }
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage]as? UIImage {
            staticImageview.image = selectedImage
            staticImageview.contentMode = .scaleAspectFill
            staticImageview.clipsToBounds = true
            
            
            
            let leadingConstraint = NSLayoutConstraint.init(item: staticImageview, attribute: .leading, relatedBy: .equal, toItem: staticImageview.superview, attribute: .leading, multiplier: 1, constant: 0)
            leadingConstraint.isActive = true
            
             let trailingConstraint = NSLayoutConstraint.init(item: staticImageview, attribute: .trailing , relatedBy: .equal, toItem: staticImageview.superview, attribute: .trailing, multiplier: 1, constant: 0)
            trailingConstraint.isActive = true
            
             let topConstraint = NSLayoutConstraint.init(item: staticImageview, attribute: .top, relatedBy: .equal, toItem: staticImageview.superview, attribute: .top, multiplier: 1, constant: 0)
            topConstraint.isActive = true
            
             let bottomConstraint = NSLayoutConstraint.init(item: staticImageview, attribute: .bottom, relatedBy: .equal, toItem: staticImageview.superview, attribute: .bottom, multiplier: 1, constant: 0)
            bottomConstraint.isActive = true
        }
         dismiss(animated: true, completion: nil)
        
    }

    
    @IBAction func saveRestaurant(_ sender: UIBarButtonItem) {
        
        var rest = RestaurantMO(context: context)
        rest.name = restNameTextFeild.text
        rest.location = restLocationTextFeild.text
        rest.type = restTypeTextFeild.text
        //rest.isVisited = isVisited
        
        if let restImage = staticImageview.image{
            if let imageData = UIImagePNGRepresentation(restImage){
                rest.image = NSData(data: imageData) as Data
            }
        }
        print("saveing data to context ....")
        ad.saveContext()
        
        dismiss(animated: true, completion: nil)    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
