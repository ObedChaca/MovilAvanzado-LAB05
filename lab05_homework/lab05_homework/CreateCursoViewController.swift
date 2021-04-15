import UIKit

class CreateCursoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var inputname: UITextField!
    
    @IBOutlet weak var inputp1: UITextField!
    @IBOutlet weak var inputp2: UITextField!
    @IBOutlet weak var inputp3: UITextField!
    
    @IBOutlet weak var inputl1: UITextField!
    @IBOutlet weak var inputl2: UITextField!
    @IBOutlet weak var inputl3: UITextField!
    
    @IBOutlet weak var inputef: UITextField!
    
    @IBOutlet weak var btnsave: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputp1.delegate = self
        inputp2.delegate = self
        inputp3.delegate = self
        inputl1.delegate = self
        inputl2.delegate = self
        inputl3.delegate = self
        inputef.delegate = self
        
    }
    
    @IBAction func createCurso(_ sender: Any) {
        
        if (inputp1.text == "" || inputp2.text == "" || inputp3.text == "" || inputl1.text == "" || inputl2.text == "" || inputl3.text == "" || inputef.text == "" || inputname.text == ""){
                
                let alert = UIAlertController(title: "Alerta", message: "Debe completar todos los campos correctamente", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    switch action.style{
                    case .default:
                        print("default")
                        
                    case .cancel:
                        print("cancel")
                        
                    case .destructive:
                        print("destructive")
                        
                    }
                }))
                self.present(alert, animated: true, completion: nil)
                
            } else {
                
            let p1:Float = Float(inputp1.text!)!
            let p2:Float = Float(inputp2.text!)!
            let p3:Float = Float(inputp3.text!)!
            
            let promp:Float = (p1 + p2 + p3) / 3
            
            let l1:Float = Float(inputl1.text!)!
            let l2:Float = Float(inputl2.text!)!
            let l3:Float = Float(inputl3.text!)!
            
            let proml:Float = (l1 + l2 + l3) / 3
            
            let exf:Float = Float(inputef.text!)!
            
            let promg:Float = (promp * 0.3) + (proml * 0.5) + (exf * 0.2)
            
            if (p1 <= 20 && p2 <= 20 && p3 <= 20 && l1 <= 20 && l2 <= 20 && l3 <= 20 && exf <= 20){
                
                let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let curso = CrearCurso(context: context)
                curso.name = inputname.text
                curso.prac1 = Float(inputp1.text!)!
                curso.prac2 = Float(inputp2.text!)!
                curso.prac3 = Float(inputp3.text!)!
                curso.lab1 = Float(inputl1.text!)!
                curso.lab2 = Float(inputl2.text!)!
                curso.lab3 = Float(inputl3.text!)!
                curso.exfinal = Float(inputef.text!)!
                
                curso.promprac = (p1 + p2 + p3) / 3
                curso.promlab = (l1 + l2 + l3) / 3
                curso.promgen = promg
                
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
                navigationController!.popViewController(animated: true)
                
            }  else {
                
                let alert = UIAlertController(title: "Alerta", message: "Solo puede se pueden ingresar notas menos o igual a 20", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                    switch action.style{
                    case .default:
                        print("default")
                        
                    case .cancel:
                        print("cancel")
                        
                    case .destructive:
                        print("destructive")
                        
                    }
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count < 3
    }
}
