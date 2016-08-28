//
//  BookmarkTableViewCell.swift
//  BibleReadingList
//
//  Created by Joshua Poehls on 8/27/16.
//
//

import UIKit

class BookmarkTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    var prevAction: ((BookmarkTableViewCell) -> Void)?
    var nextAction: ((BookmarkTableViewCell) -> Void)?
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var booksLabel: UILabel!

    @IBAction func prevButtonPressed(_ sender: AnyObject) {
        prevAction?(self)
    }
    
    @IBAction func nextButtonPressed(_ sender: AnyObject) {
        nextAction?(self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
