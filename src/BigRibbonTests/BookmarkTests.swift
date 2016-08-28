import XCTest
@testable import BibleReadingList

class BookmarkTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBookmarkInitWithReadingList() {
        let b = Bookmark(list: ReadingList.profGrantHorner1)
        XCTAssertNotNil(b)
        XCTAssertEqual(1, b.chapter, "should start at chapter 1")
        XCTAssert(ReadingList.profGrantHorner1.books[0] === b.book, "should start at the first book in the list")
        XCTAssert(ReadingList.profGrantHorner1 === b.list, "should set the list")
    }
    
    func testBookmarkInitWithReadingListAndPosition() {
        let b = Bookmark(list: ReadingList.profGrantHorner1, book: ReadingList.profGrantHorner1.books[1], chapter: 10)
        XCTAssertNotNil(b)
        XCTAssertEqual(10, b.chapter, "should start at specified chapter")
        XCTAssert(ReadingList.profGrantHorner1.books[1] === b.book, "should start at specified book")
        XCTAssert(ReadingList.profGrantHorner1 === b.list, "should set the list")
    }
    
    func testIncToNextBook() {
        let l = ReadingList.profGrantHorner1
        let b = Bookmark(list: l, book: l.books[0], chapter: l.books[0].chapters)
        
        // act
        b.inc()
        
        // assert
        XCTAssert(l.books[1] === b.book, "should increment to next book")
        XCTAssertEqual(1, b.chapter, "should reset chapter to 1")
    }
    
    func testIncToNextChapter() {
        let l = ReadingList.profGrantHorner1
        let b = Bookmark(list: l, book: l.books[0], chapter: 1)
        
        // act
        b.inc()
        
        // assert
        XCTAssert(l.books[0] === b.book, "should not change books")
        XCTAssertEqual(2, b.chapter, "should increment chapter")
    }
    
    func testIncToBeginningOfList() {
        let l = ReadingList.profGrantHorner1
        let b = Bookmark(list: l, book: l.books[3], chapter: l.books[3].chapters)
        
        // act
        b.inc()
        
        // assert
        XCTAssert(l.books[0] === b.book, "should reset to first book")
        XCTAssertEqual(1, b.chapter, "should reset chapter to 1")
    }

    func testDecToEndOfList() {
        let l = ReadingList.profGrantHorner1
        let b = Bookmark(list: l, book: l.books[0], chapter: 1)
        
        // act
        b.dec()
        
        // assert
        XCTAssert(l.books[3] === b.book, "should move to last book")
        XCTAssertEqual(l.books[3].chapters, b.chapter, "should move to last chapter")
    }
    
    func testDecToPrevBook() {
        let l = ReadingList.profGrantHorner1
        let b = Bookmark(list: l, book: l.books[1], chapter: 1)
        
        // act
        b.dec()
        
        // assert
        XCTAssert(l.books[0] === b.book, "should move to previous book")
        XCTAssertEqual(l.books[0].chapters, b.chapter, "should move to last chapter")
    }
    
    func testDecToPrevChapter() {
        let l = ReadingList.profGrantHorner1
        let b = Bookmark(list: l, book: l.books[0], chapter: 2)
        
        // act
        b.dec()
        
        // assert
        XCTAssert(l.books[0] === b.book, "shouldn't change books")
        XCTAssertEqual(1, b.chapter, "should move to previous chapter")
    }
    
    /*
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    */
}
