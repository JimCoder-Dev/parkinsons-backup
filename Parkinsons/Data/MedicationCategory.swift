import Foundation

struct MedicationCategory: Identifiable{
    let id = UUID()
    let name: String
    var items: [MedicationCategory]?
    var brandName: [MedicationBrandName]?
    
    
    static let levodopa = MedicationCategory(name:  "Levodopa", items: [MedicationCategory(name: "Co-beneldopa", brandName: [MedicationBrandName(name: "Madopar", form: .capsules), MedicationBrandName(name: "Madopar CR", form: .crcapsules)]), MedicationCategory(name: "Co-careldopa", brandName: [MedicationBrandName(name: "Apodespan", form: .prtablets), MedicationBrandName(name: "Caramet", form: .crtablets), MedicationBrandName(name: "Lecado", form: .mrtablets), MedicationBrandName(name: "Half Sinemet", form: .crtablets), MedicationBrandName(name: "Sinemet", form: .tablets), MedicationBrandName(name: "Sinemet Plus", form: .tablets), MedicationBrandName(name: "Sinemet CR", form: .crtablets), MedicationBrandName(name: "Duodopa", form: .intestinalgel)]), MedicationCategory(name: "Co-careldopa and entacapone", brandName: [MedicationBrandName(name: "Stalevo", form: .tablets), MedicationBrandName(name: "Sastravi", form: .tablets), MedicationBrandName(name: "Stanek", form: .tablets)]), MedicationCategory(name: "Entacapone", brandName: [MedicationBrandName(name: "Comtess", form: .tablets)])])
    static let dopamineAgonists = MedicationCategory(name: "Dopamine agonists", items: [MedicationCategory(name: "Pramipexole", brandName: [MedicationBrandName(name: "Mirapexin", form: .tablets), MedicationBrandName(name: "Mirapexin prolonged release", form: .prtablets), MedicationBrandName(name: "Pipexus", form: .mrtablets), MedicationBrandName(name: "Glepark", form: .tablets), MedicationBrandName(name: "Oprymea", form: .tablets), MedicationBrandName(name: "Zentiva", form: .prtablets)]), MedicationCategory(name: "Ropinirole", brandName: [MedicationBrandName(name: "Adartrel", form: .tablets), MedicationBrandName(name: "Ralnea XL", form: .prtablets), MedicationBrandName(name: "Requip", form: .tablets), MedicationBrandName(name: "Requip XL", form: .prtablets), MedicationBrandName(name: "Spiroco XL", form: .prtablets), MedicationBrandName(name: "Ipinnia XL", form: .prtablets), MedicationBrandName(name: "Raponer XL", form: .prtablets), MedicationBrandName(name: "Repinex XL", form: .prtablets), MedicationBrandName(name: "Ropilynz XL", form: .prtablets)]), MedicationCategory(name: "Rotigotine", brandName: [MedicationBrandName(name: "Neupro", form: .skinpatch)]), MedicationCategory(name: "Apomorphine", brandName: [MedicationBrandName(name: "Apo-go pre filled pen", form: .injection), MedicationBrandName(name: "Dacepton cartridge", form: .injection), MedicationBrandName(name: "Apo-go pre-filled syringe for infusion", form: .infusion), MedicationBrandName(name: "Dacepton Vial", form: .infusion)])])
    static let MAOB = MedicationCategory(name: "MAO-B inhibitors", items: [MedicationCategory(name: "Rasagiline", brandName: [MedicationBrandName(name: "Azilect", form: .tablets)]), MedicationCategory(name: "Selegiline", brandName: [MedicationBrandName(name: "Eldepryl", form: .tablets), MedicationBrandName(name: "Zelapar", form: .tablets)]), MedicationCategory(name: "Safinamide", brandName: [MedicationBrandName(name: "Xadago", form: .tablets)])])
    static let COMT = MedicationCategory(name: "COMT inhibitors", items: [MedicationCategory(name: "Entacapone", brandName: [MedicationBrandName(name: "Comtess", form: .tablets)]), MedicationCategory(name: "Co-careldopa and entacapone", brandName: [MedicationBrandName(name: "Stalevo", form: .tablets), MedicationBrandName(name: "Sastravi", form: .tablets), MedicationBrandName(name: "Stanek", form: .tablets)]), MedicationCategory(name: "Tolcapone", brandName: [MedicationBrandName(name: "Tasmar", form: .tablets)]),MedicationCategory(name: "Opicapone", brandName: [MedicationBrandName(name: "Ongentys", form: .tablets)])])
}


struct MedicationBrandName: Identifiable{
    var id = UUID()
    var name: String
    let form: MedicineType
    static let example = MedicationBrandName(name: "Please select a medication", form: .tablets)
}






