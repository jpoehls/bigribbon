import Foundation

class ReadingList : CustomStringConvertible {
    let id: Int
    let books: [Book]
    let chapters: Int
    
    init(id: Int, books: [Book]) {
        self.id = id
        self.books = books
        self.chapters = books.map { return $0.chapters }.reduce(0, +)
    }
    
    var description: String {
        return "List Id: \(self.id)"
    }
    
    static let profGrantHorner1 = ReadingList(id: 1, books: [Book](arrayLiteral: Book.matt, Book.mark, Book.luke, Book.john))
    static let profGrantHorner2 = ReadingList(id: 2, books: [Book](arrayLiteral: Book.gen, Book.exod, Book.lev, Book.num, Book.deut))
    static let profGrantHorner3 = ReadingList(id: 3, books: [Book](arrayLiteral: Book.rom, Book.cor1, Book.cor2, Book.gal, Book.eph, Book.phil, Book.col, Book.heb))
    static let profGrantHorner4 = ReadingList(id: 4, books: [Book](arrayLiteral: Book.thess1, Book.thess2, Book.tim1, Book.tim2, Book.titus, Book.phim, Book.jas, Book.pet1, Book.pet2, Book.john1, Book.john2, Book.john3, Book.jude, Book.rev))
    static let profGrantHorner5 = ReadingList(id: 5, books: [Book](arrayLiteral: Book.job, Book.eccl, Book.song))
    static let profGrantHorner6 = ReadingList(id: 6, books: [Book](arrayLiteral: Book.ps))
    static let profGrantHorner7 = ReadingList(id: 7, books: [Book](arrayLiteral: Book.prov))
    static let profGrantHorner8 = ReadingList(id: 8, books: [Book](arrayLiteral: Book.josh, Book.judg, Book.ruth, Book.sam1, Book.sam2, Book.kgs1, Book.kgs2, Book.chr1, Book.chr2, Book.ezra, Book.neh, Book.esth))
    static let profGrantHorner9 = ReadingList(id: 9, books: [Book](arrayLiteral: Book.isa, Book.jer, Book.lam, Book.ezek, Book.dan, Book.hos, Book.joel, Book.amos, Book.obad, Book.jonah, Book.mic, Book.nah, Book.hab, Book.zeph, Book.hag, Book.zech, Book.mal))
    static let profGrantHorner10 = ReadingList(id: 10, books: [Book](arrayLiteral: Book.acts))
    
    static let byId = [profGrantHorner1.id:profGrantHorner1,
                       profGrantHorner2.id:profGrantHorner2,
                       profGrantHorner3.id:profGrantHorner3,
                       profGrantHorner4.id:profGrantHorner4,
                       profGrantHorner5.id:profGrantHorner5,
                       profGrantHorner6.id:profGrantHorner6,
                       profGrantHorner7.id:profGrantHorner7,
                       profGrantHorner8.id:profGrantHorner8,
                       profGrantHorner9.id:profGrantHorner9,
                       profGrantHorner10.id:profGrantHorner10]
}
