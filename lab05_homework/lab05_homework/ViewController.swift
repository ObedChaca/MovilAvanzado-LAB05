import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cursos:[CrearCurso] = []
    let newblue = UIColor(red: 0.0/255.0, green: 107.0/255.0, blue: 225.0/255.0, alpha: 1.0)
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.navigationBar.barTintColor = newblue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = newblue
        obtenerCurso()
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cursos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let curso = cursos[indexPath.row]
        cell.textLabel?.text = curso.name
        return cell
    }
    
    @IBAction func createCurso(_ sender: Any) {
        performSegue(withIdentifier: "createCurso", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let curso = cursos[indexPath.row]
        performSegue(withIdentifier: "detailCurso", sender: curso)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            context.delete(cursos.remove(at: indexPath.row))
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            tableView.reloadData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let curso = cursos[indexPath.row]
        let newred = UIColor(red: 198.0/255.0, green: 90.0/255.0, blue: 93.0/255.0, alpha: 1.0)
        let newgreen = UIColor(red: 0.0/255.0, green: 209.0/255.0, blue: 130.0/255.0, alpha: 1.0)
        if curso.promgen < 13 {
            cell.backgroundColor = newred
        } else if (curso.promgen >= 13) {
            cell.backgroundColor = newgreen
        } else if (curso.promgen == 0) {
            cell.backgroundColor = UIColor.white
        }
    }
    
    func obtenerCurso(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            cursos = try context.fetch(CrearCurso.fetchRequest()) as! [CrearCurso]
        } catch {
            print("Error")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailCurso"{
            let nextVC = segue.destination as! CourseInViewController
            nextVC.cursod = sender as! CrearCurso
        }
        
    }
    
    
}

