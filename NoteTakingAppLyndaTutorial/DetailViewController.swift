//
//  DetailViewController.swift
//  NoteTakingAppLyndaTutorial
//
//  Created by Tener ArteneR on 6/12/16.
//  Copyright © 2016 Tener ArteneR. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tvNoteText: UITextView!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if objects.count == 0 {
            return
        }
        if let label = self.tvNoteText {
            label.text = objects[currentIndex]
            if label.text == BLANK_NOTE {
                label.text = ""
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        detailViewController = self
        tvNoteText.becomeFirstResponder()
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if objects.count == 0 {
            return
        }
        objects[currentIndex] = tvNoteText.text
        if tvNoteText.text == "" {
            objects[currentIndex] = BLANK_NOTE
        }
        saveAndUpdate()
    }
    
    
    func saveAndUpdate() {
        masterView?.save()
        masterView?.tableView.reloadData()
    }

}

