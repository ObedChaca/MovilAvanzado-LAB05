import UIKit

class PractNotesViewController: UIViewController {
    
    var p1:Float = 0
    
    var cursop:CrearCurso? = nil
    
    @IBOutlet weak var inputpract1: UITextField!
    @IBOutlet weak var inputpract2: UITextField!
    @IBOutlet weak var inputpract3: UITextField!
    
    @IBOutlet weak var btnpractsave: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notas de Práctica"
        
        p1 = cursop!.prac1
        inputpract1.text! = String(p1)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @IBAction func addPract(_ sender: Any) {
        
        
        navigationController?.popViewController(animated: true)
        
        
    }
    
    
}
