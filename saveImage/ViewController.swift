//
//  ViewController.swift
//  saveImage
//
//  Created by Mohan K on 16/03/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var managedObjectContext: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.saveContext()
        managedObjectContext = appDelegate.persistentContainer.viewContext
        var students = fetchStudents()
       
        if students?.count == 0 {
            createStudent(name: "pradeep", rollnumber: "01", email: "pradeep@sample.com", phonenumber: "9756789833")
            createStudent(name: "pradeepragunathaan", rollnumber: "06", email: "pradeepragu@sample.com", phonenumber: "9839393993")
          
            students = fetchStudents()
        }
        
        let tableview = UITableView(frame: view.bounds, style: .plain)
        tableview.dataSource = self
        view.addSubview(tableview)
    }
    
    func createStudent(name: String,rollnumber: String, email: String, phonenumber: String){
        let studentEntity = NSEntityDescription.entity(forEntityName: "Student", in: managedObjectContext!)!
        let student = NSManagedObject(entity: studentEntity, insertInto: managedObjectContext)
        
        student.setValue(name, forKey: "name")
        student.setValue(rollnumber, forKey: "rollnumber")
        student.setValue(email, forKey: "email")
        student.setValue(phonenumber, forKey: "phonenumber")
        do {
            try managedObjectContext?.save()
        }
        catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    func fetchStudents() -> [NSManagedObject]? {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do {
            let students = try managedObjectContext?.fetch(fetchRequest)
            return students}
        catch let error as NSError {
            print("Could not fetch .\(error), \(error.userInfo) ")
            return nil
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let students = fetchStudents()
        let student = students![indexPath.row]
        cell.textLabel?.text = student.value(forKey: "name")as? String
        cell.detailTextLabel?.text = student.value(forKey: "rollnumber") as? String
        return cell
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let students = fetchStudents()
        return students?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let students = fetchStudents()
        let student  = students![indexPath.row]
        
        let alert = UIAlertController(title: "Edit", message: nil, preferredStyle: .alert)
        alert.addTextField {(textField) in
            textField.text = student.value(forKey: "name") as! String?
        }
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action) in
            if let newName = alert.textFields?.first?.text {
                student.setValue(newName , forKey: "name")
                self.managedObjectContext?.save()
//                self.tableView.reloadData()
        }
            
        }))
        present(alert, animated: true, completion: nil)
    }
    
}
