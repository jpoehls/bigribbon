import Foundation
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class Bookmark : NSObject, NSCoding {
    
    // MARK: Properties
    
    let list: ReadingList
    var book: Book
    var chapter: Int
    var lastIncremented: NSDate?
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("bookmarks")
    
    init(list: ReadingList) {
        self.list = list
        book = list.books[0]
        chapter = 1
    }
    
    init(list: ReadingList, book: Book, chapter: Int) {
        self.list = list
        self.book = book
        self.chapter = chapter
    }
    
    init(list: ReadingList, book: Book, chapter: Int, lastIncremented: NSDate?) {
        self.list = list
        self.book = book
        self.chapter = chapter
        self.lastIncremented = lastIncremented
    }
    
    override var description: String {
        return "\(self.book.osisId) \(self.chapter) (List: \(self.list.id))"
    }
    
    func inc() {
        if (chapter < book.chapters) {
            chapter += 1
        }
        else {
            book = nextBook()
            chapter = 1
        }
        lastIncremented = NSDate()
    }
    
    func dec() {
        if (chapter > 1) {
            chapter -= 1
        }
        else {
            book = prevBook()
            chapter = book.chapters
        }
        lastIncremented = nil
    }
    
    fileprivate func prevBook() -> Book {
        let idx = list.books.index{$0 === book}
        if (idx > 0) {
            return list.books[idx!-1]
        }
        else {
            return list.books[list.books.count-1]
        }
    }
    
    fileprivate func nextBook() -> Book {
        let idx = list.books.index{$0 === book}
        if (idx < list.books.count-1) {
            return list.books[idx!+1]
        }
        else {
            return list.books[0]
        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(list.id, forKey: PropertyKey.listIdKey)
        aCoder.encode(book.id, forKey: PropertyKey.bookIdKey)
        aCoder.encode(chapter, forKey: PropertyKey.chapterKey)
        aCoder.encode(lastIncremented, forKey: PropertyKey.lastIncrementedKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let listId = aDecoder.decodeInteger(forKey: PropertyKey.listIdKey)
        let bookId = aDecoder.decodeInteger(forKey: PropertyKey.bookIdKey)
        let chapter = aDecoder.decodeInteger(forKey: PropertyKey.chapterKey)
        let lastIncremented = aDecoder.decodeObject(forKey: PropertyKey.lastIncrementedKey) as? NSDate
        
        let list = ReadingList.byId[listId]!
        let book = Book.byId[bookId]!
        
        self.init(list:list, book:book, chapter:chapter, lastIncremented: lastIncremented)
    }
    
    func incrementedToday() -> Bool {
        if ((self.lastIncremented) != nil && NSCalendar.current.isDateInToday(self.lastIncremented! as Date)) {
            return true
        }
        else {
            return false
        }
    }
    
    func incrementedYesterday() -> Bool {
        if ((self.lastIncremented) != nil && NSCalendar.current.isDateInYesterday(self.lastIncremented! as Date)) {
            return true
        }
        else {
            return false
        }
    }
}
