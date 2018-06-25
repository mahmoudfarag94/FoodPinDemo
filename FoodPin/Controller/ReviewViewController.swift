
import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var backGroundImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var reviewImageView: UIImageView!
    //var reviewRestaurant:RestaurantMO!
     var reviewRestaurant:RestauranteModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backGroundImageView.addSubview(blurEffectView)
        containerView.transform = CGAffineTransform.init(scaleX: 0, y: 0)
       // containerView.transform = CGAffineTransform(translationX: 0, y: -1000)
        backGroundImageView.image = UIImage(named: reviewRestaurant.image! )
        reviewImageView.image = UIImage(named: reviewRestaurant.image!)
       
        // backGroundImageView.image = UIImage(data: reviewRestaurant.image as! Data)
       // reviewImageView.image = UIImage(data: reviewRestaurant.image as! Data)
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
       
//        UIView.animate(withDuration: 0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.2, options: .curveEaseOut, animations: {
//            self.containerView.transform = CGAffineTransform.identity
//        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.containerView.transform = CGAffineTransform.identity
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
