import UIKit

class CourseInViewController: UIViewController {
    
    @IBOutlet weak var lblpromp: UILabel!
    @IBOutlet weak var lblproml: UILabel!
    
    @IBOutlet weak var lblp1: UILabel!
    @IBOutlet weak var lblp2: UILabel!
    @IBOutlet weak var lblp3: UILabel!
    
    @IBOutlet weak var lbll1: UILabel!
    @IBOutlet weak var lbll2: UILabel!
    @IBOutlet weak var lbll3: UILabel!
    
    @IBOutlet weak var lblef: UILabel!
    @IBOutlet weak var lblpromf: UILabel!
    
    
    var cursod:CrearCurso? = nil
    
    @IBOutlet weak var btndelete: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = cursod!.name
        
        lblpromp.text = String(format:"%.2f", cursod!.promprac)
        lblp1.text = String(cursod!.prac1)
        lblp2.text = String(cursod!.prac2)
        lblp3.text = String(cursod!.prac3)
        
        lblproml.text = String(format:"%.2f",cursod!.promlab)
        lbll1.text = String(cursod!.lab1)
        lbll2.text = String(cursod!.lab2)
        lbll3.text = String(cursod!.lab3)
        
        lblef.text = String(cursod!.exfinal)
        lblpromf.text = String(format:"%.2f",cursod!.promgen)
        
        let promf:Float = cursod!.promgen
        let newred = UIColor(red: 198.0/255.0, green: 90.0/255.0, blue: 93.0/255.0, alpha: 1.0)
        let newgreen = UIColor(red: 0.0/255.0, green: 209.0/255.0, blue: 130.0/255.0, alpha: 1.0)
        if (promf < 13) {
            navigationController?.navigationBar.barTintColor = newred
        } else if (promf > 13){
            navigationController?.navigationBar.barTintColor = newgreen
        }
        
    }
    
    @IBAction func eliminarcurso(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(cursod!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    navigationController?.popViewController(animated: true)
    }
    
    
    

}
