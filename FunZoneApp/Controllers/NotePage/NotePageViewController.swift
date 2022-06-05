//
//  NotePageViewController.swift
//  FunZoneApp
//
//  Created by Vincent Salinas on 6/3/22.
//

import UIKit

class NotePageViewController: UIViewController {
    
    var note : Note?
    
    @IBOutlet weak var noteTableView: UITableView!
    
    var noteContents = [String?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        noteTableView.dataSource = self
        initialize()
        
    }
    
    func initialize() {
        noteContents = [note?.title, note?.desc, note?.body]
    }
    
    @IBAction func editNote(_ sender: Any) {
        let editNoteVC = getTarget(target: "EditNotePageViewController") as! EditNotePageViewController
        editNoteVC.note = note
        segueToVC(target: "EditNotePageViewController", sender: self)
    }
    
    //    @IBAction func deleteNote(_ sender: Any) {
//        let status = DBHelperClass.dbHelper.deleteNote(title: note!.title!)
//        if (status) {
//            segueToVC(target: "NotesPageViewController", sender: self)
//            print("successfully deleted note")
//        } else {
//            print("failed to delete note")
//        }
//        print("deleted note successfully")
//
//    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension NotePageViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteContents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = noteTableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        
        cell.textLabel?.text = noteContents[indexPath.row]
        cell.textLabel?.numberOfLines  = 0
        cell.textLabel?.textColor = UIColor.white
        
        return cell
        
    }
    
    
}
