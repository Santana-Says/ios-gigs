//
//  GigsTableVC.swift
//  Gigs
//
//  Created by Jeffrey Santana on 8/7/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class GigsTableVC: UITableViewController {
	
	//MARK: - IBOutlets
	
	
	//MARK: - Properties
	
	var gigController: GigController?
	private var gigs: [Gig] {
		guard let gigs = gigController?.gigs else { return [Gig]() }
		return gigs
	}
//	private var dateFormatter: DateFormatter {
//		let formatter = DateFormatter()
//	}
	
	//MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		gigController = GigController()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		if gigController?.bearer == nil {
			performSegue(withIdentifier: "LoginVCModalSegue", sender: nil)
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let loginVC = segue.destination as? LoginVC {
			loginVC.gigController = gigController
		}
	}
	
	//MARK: - IBActions
	
	
	//MARK: - Helpers
	

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return gigs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GigCell", for: indexPath)
        let gig = gigs[indexPath.row]
		
		cell.textLabel?.text = gig.title
		cell.detailTextLabel?.text = DateFormatter().string(from: gig.dueDate)

        return cell
    }
}