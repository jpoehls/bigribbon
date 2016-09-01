import UIKit

class BookmarkViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var bookmarks = [Bookmark]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Load any saved bookmarks, otherwise load default data.
        if let savedBookmarks = loadBookmarks() {
            bookmarks += savedBookmarks
        }
        else {
            loadDefaultBookmarks()
        }
    }
    
    func loadDefaultBookmarks() {
        bookmarks += [
            Bookmark(list: ReadingList.profGrantHorner1),
            Bookmark(list: ReadingList.profGrantHorner2),
            Bookmark(list: ReadingList.profGrantHorner3),
            Bookmark(list: ReadingList.profGrantHorner4),
            Bookmark(list: ReadingList.profGrantHorner5),
            Bookmark(list: ReadingList.profGrantHorner6),
            Bookmark(list: ReadingList.profGrantHorner7),
            Bookmark(list: ReadingList.profGrantHorner8),
            Bookmark(list: ReadingList.profGrantHorner9),
            Bookmark(list: ReadingList.profGrantHorner10)
        ]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "BookmarkTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! BookmarkTableViewCell
        
        // Fetches the appropriate bookmark for the data source layout.
        let bookmark = bookmarks[(indexPath as NSIndexPath).row]
        
        renderBookmark(cell, bookmark: bookmark)
        
        cell.prevAction = { (cell) in
            let idx = (tableView.indexPath(for: cell)! as NSIndexPath).row
            let bookmark = self.bookmarks[idx]
            self.decrementBookmark(cell, bookmark: bookmark)
        }
        
        cell.nextAction = { (cell) in
            let idx = (tableView.indexPath(for: cell)! as NSIndexPath).row
            let bookmark = self.bookmarks[idx]
            self.incrementBookmark(cell, bookmark: bookmark)
        }
        
        cell.bookmarkAction = { (cell) in
            let idx = (tableView.indexPath(for: cell)! as NSIndexPath).row
            let bookmark = self.bookmarks[idx]
            self.readBookmark(cell, bookmark: bookmark)
        }
        
        return cell
    }
    
    func readBookmark(_ cell: BookmarkTableViewCell, bookmark: Bookmark) {

        let url = URL(string: "bible://" + bookmark.book.osisId + "+" + bookmark.chapter.description + ":1")
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.openURL(url!)
        }
        else {
            let errAlert = UIAlertController(title: "Oops", message: "Can't open bible://", preferredStyle: UIAlertControllerStyle.alert)
            errAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(errAlert, animated: true, completion: nil)
        }
    }
    
    func incrementBookmark(_ cell: BookmarkTableViewCell, bookmark: Bookmark) {
        bookmark.inc()
        print("incremented list " + bookmark.list.id.description)
        
        self.saveBookmarks()
        
        self.renderBookmark(cell, bookmark: bookmark)
    }
    
    func decrementBookmark(_ cell: BookmarkTableViewCell, bookmark: Bookmark) {
        bookmark.dec()
        print("decremented list " + bookmark.list.id.description)
        
        self.saveBookmarks()
        
        self.renderBookmark(cell, bookmark: bookmark)
    }
    
    func renderBookmark(_ cell: BookmarkTableViewCell, bookmark: Bookmark) {
        
        cell.nameLabel.text = "List\u{00a0}" + bookmark.list.id.description
        cell.daysLabel.text = bookmark.list.chapters.description + " days"
        
        let s = NSMutableAttributedString()
        for i in 0 ..< bookmark.list.books.count {
            let book = bookmark.list.books[i]
            var txt = book.osisId
            var attrs: [String:Any]?
            if (book === bookmark.book) {
                txt = book.name + "\u{00a0}" + bookmark.chapter.description
                attrs = [
                    NSFontAttributeName:UIFont.boldSystemFont(ofSize: cell.booksButton.titleLabel!.font.pointSize),
                    NSForegroundColorAttributeName:cell.nameLabel.textColor
                ]
            }
            else {
                attrs = [
                    NSFontAttributeName:UIFont.systemFont(ofSize: cell.booksButton.titleLabel!.font.pointSize),
                    NSForegroundColorAttributeName:cell.daysLabel.textColor
                ]
            }
            
            if i < bookmark.list.books.count-1 {
                txt += ", "
            }
            
            s.append(NSAttributedString(string: txt, attributes: attrs))
        }
        
        cell.booksButton.setAttributedTitle(s, for: UIControlState.normal)
        
        if (bookmark.incrementedToday()) {
            cell.backgroundColor = UIColor(red:0.67, green:0.98, blue:0.73, alpha:1.0)
        }
        else if (bookmark.incrementedYesterday()) {
            cell.backgroundColor = UIColor(red:0.67, green:0.98, blue:0.73, alpha:0.3)
        }
        else {
            cell.backgroundColor = UIColor.white
        }
    }
    
    // MARK: NSCoding
    
    func saveBookmarks() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(bookmarks, toFile: Bookmark.ArchiveURL.path)
        if !isSuccessfulSave {
            print("Failed to save bookmarks...")
        }
    }
    
    func loadBookmarks() -> [Bookmark]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Bookmark.ArchiveURL.path) as? [Bookmark]
    }

}
