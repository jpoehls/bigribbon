import Foundation

class Book : CustomStringConvertible {
    let id: Int
    let osisId: String
    let name: String
    let chapters: Int
    
    fileprivate init(id: Int, osisId: String, name: String, chapters: Int) {
        self.id = id
        self.osisId = osisId
        self.name = name
        self.chapters = chapters
    }
    
    var description: String {
        return "\(self.osisId)"
    }
    
    static let gen = Book(id:1, osisId:"Gen", name:"Genesis", chapters:50)
    static let exod = Book(id:2, osisId:"Exod", name:"Exodus", chapters:40)
    static let lev = Book(id:3, osisId:"Lev", name:"Leviticus", chapters:27)
    static let num = Book(id:4, osisId:"Num", name:"Numbers", chapters:36)
    static let deut = Book(id:5, osisId:"Deut", name:"Deuteronomy", chapters:34)
    static let josh = Book(id:6, osisId:"Josh", name:"Joshua", chapters:24)
    static let judg = Book(id:7, osisId:"Judg", name:"Judges", chapters:21)
    static let ruth = Book(id:8, osisId:"Ruth", name:"Ruth", chapters:4)
    static let sam1 = Book(id:9, osisId:"1Sam", name:"1 Samuel", chapters:31)
    static let sam2 = Book(id:10, osisId:"2Sam", name:"2 Samuel", chapters:24)
    static let kgs1 = Book(id:11, osisId:"1Kgs", name:"1 Kings", chapters:22)
    static let kgs2 = Book(id:12, osisId:"2Kgs", name:"2 Kings", chapters:25)
    static let chr1 = Book(id:13, osisId:"1Chr", name:"1 Chronicles", chapters:29)
    static let chr2 = Book(id:14, osisId:"2Chr", name:"2 Chronicles", chapters:36)
    static let ezra = Book(id:15, osisId:"Ezra", name:"Ezra", chapters:10)
    static let neh = Book(id:16, osisId:"Neh", name:"Nehemiah", chapters:13)
    static let esth = Book(id:17, osisId:"Esth", name:"Esther", chapters:10)
    static let job = Book(id:18, osisId:"Job", name:"Job", chapters:42)
    static let ps = Book(id:19, osisId:"Ps", name:"Psalm", chapters:150)
    static let prov = Book(id:20, osisId:"Prov", name:"Proverbs", chapters:31)
    static let eccl = Book(id:21, osisId:"Eccl", name:"Ecclesiastes", chapters:12)
    static let song = Book(id:22, osisId:"Song", name:"Song of Solomon", chapters:8)
    static let isa = Book(id:23, osisId:"Isa", name:"Isaiah", chapters:66)
    static let jer = Book(id:24, osisId:"Jer", name:"Jeremiah", chapters:52)
    static let lam = Book(id:25, osisId:"Lam", name:"Lamentations", chapters:5)
    static let ezek = Book(id:26, osisId:"Ezek", name:"Ezekiel", chapters:48)
    static let dan = Book(id:27, osisId:"Dan", name:"Daniel", chapters:12)
    static let hos = Book(id:28, osisId:"Hos", name:"Hosea", chapters:14)
    static let joel = Book(id:29, osisId:"Joel", name:"Joel", chapters:3)
    static let amos = Book(id:30, osisId:"Amos", name:"Amos", chapters:9)
    static let obad = Book(id:31, osisId:"Obad", name:"Obadiah", chapters:1)
    static let jonah = Book(id:32, osisId:"Jonah", name:"Jonah", chapters:4)
    static let mic = Book(id:33, osisId:"Mic", name:"Micah", chapters:7)
    static let nah = Book(id:34, osisId:"Nah", name:"Nahum", chapters:3)
    static let hab = Book(id:35, osisId:"Hab", name:"Habakkuk", chapters:3)
    static let zeph = Book(id:36, osisId:"Zeph", name:"Zephaniah", chapters:3)
    static let hag = Book(id:37, osisId:"Hag", name:"Haggai", chapters:2)
    static let zech = Book(id:38, osisId:"Zech", name:"Zechariah", chapters:14)
    static let mal = Book(id:39, osisId:"Mal", name:"Malachi", chapters:4)
    static let matt = Book(id:40, osisId:"Matt", name:"Matthew", chapters:28)
    static let mark = Book(id:41, osisId:"Mark", name:"Mark", chapters:16)
    static let luke = Book(id:42, osisId:"Luke", name:"Luke", chapters:24)
    static let john = Book(id:43, osisId:"John", name:"John", chapters:21)
    static let acts = Book(id:44, osisId:"Acts", name:"Acts", chapters:28)
    static let rom = Book(id:45, osisId:"Rom", name:"Romans", chapters:16)
    static let cor1 = Book(id:46, osisId:"1Cor", name:"1 Corinthians", chapters:16)
    static let cor2 = Book(id:47, osisId:"2Cor", name:"2 Corinthians", chapters:13)
    static let gal = Book(id:48, osisId:"Gal", name:"Galatians", chapters:6)
    static let eph = Book(id:49, osisId:"Eph", name:"Ephesians", chapters:6)
    static let phil = Book(id:50, osisId:"Phil", name:"Philippians", chapters:4)
    static let col = Book(id:51, osisId:"Col", name:"Colossians", chapters:4)
    static let thess1 = Book(id:52, osisId:"1Thess", name:"1 Thessalonians", chapters:5)
    static let thess2 = Book(id:53, osisId:"2Thess", name:"2 Thessalonians", chapters:3)
    static let tim1 = Book(id:54, osisId:"1Tim", name:"1 Timothy", chapters:6)
    static let tim2 = Book(id:55, osisId:"2Tim", name:"2 Timothy", chapters:4)
    static let titus = Book(id:56, osisId:"Titus", name:"Titus", chapters:3)
    static let phim = Book(id:57, osisId:"Phim", name:"Philemon", chapters:1)
    static let heb = Book(id:58, osisId:"Heb", name:"Hebrews", chapters:13)
    static let jas = Book(id:59, osisId:"Jas", name:"James", chapters:5)
    static let pet1 = Book(id:60, osisId:"1Pet", name:"1 Peter", chapters:5)
    static let pet2 = Book(id:61, osisId:"2Pet", name:"2 Peter", chapters:3)
    static let john1 = Book(id:62, osisId:"1John", name:"1 John", chapters:5)
    static let john2 = Book(id:63, osisId:"2John", name:"2 John", chapters:1)
    static let john3 = Book(id:64, osisId:"3John", name:"3 John", chapters:1)
    static let jude = Book(id:65, osisId:"Jude", name:"Jude", chapters:1)
    static let rev = Book(id:66, osisId:"Rev", name:"Revelation", chapters:22)
    
    static let byId = [gen.id:gen,
                       exod.id:exod,
                       lev.id:lev,
                       num.id:num,
                       deut.id:deut,
                       josh.id:josh,
                       judg.id:judg,
                       ruth.id:ruth,
                       sam1.id:sam1,
                       sam2.id:sam2,
                       kgs1.id:kgs1,
                       kgs2.id:kgs2,
                       chr1.id:chr1,
                       chr2.id:chr2,
                       ezra.id:ezra,
                       neh.id:neh,
                       esth.id:esth,
                       job.id:job,
                       ps.id:ps,
                       prov.id:prov,
                       eccl.id:eccl,
                       song.id:song,
                       isa.id:isa,
                       jer.id:jer,
                       lam.id:lam,
                       ezek.id:ezek,
                       dan.id:dan,
                       hos.id:hos,
                       joel.id:joel,
                       amos.id:amos,
                       obad.id:obad,
                       jonah.id:jonah,
                       mic.id:mic,
                       nah.id:nah,
                       hab.id:hab,
                       zeph.id:zeph,
                       hag.id:hag,
                       zech.id:zech,
                       mal.id:mal,
                       matt.id:matt,
                       mark.id:mark,
                       luke.id:luke,
                       john.id:john,
                       acts.id:acts,
                       rom.id:rom,
                       cor1.id:cor1,
                       cor2.id:cor2,
                       gal.id:gal,
                       eph.id:eph,
                       phil.id:phil,
                       col.id:col,
                       thess1.id:thess1,
                       thess2.id:thess2,
                       tim1.id:tim1,
                       tim2.id:tim2,
                       titus.id:titus,
                       phim.id:phim,
                       heb.id:heb,
                       jas.id:jas,
                       pet1.id:pet1,
                       pet2.id:pet2,
                       john1.id:john1,
                       john2.id:john2,
                       john3.id:john3,
                       jude.id:jude,
                       rev.id:rev]
}
