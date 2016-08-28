import XCTest
@testable import BibleReadingList

class ReadingListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testReadingListInit() {
        let books = [Book](arrayLiteral: Book.matt, Book.mark)
        let l = ReadingList(id: 1, books: books)
        XCTAssertNotNil(l)
        XCTAssertEqual(1, l.id, "should use specified id")
        //XCTAssert(books === l.books, "should use specified books")
        XCTAssertEqual(44, l.chapters, "should calculate the total chapters")
    }
}
