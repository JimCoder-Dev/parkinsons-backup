import Foundation


enum MedicineType: String, CaseIterable{
    case capsules = "Capsules"
    case crcapsules = "Controlled release capsules"
    case tablets = "Tablets"
    case prtablets = "Prolonged release tablets"
    case crtablets = "Controlled released tablets"
    case mrtablets = "Modified release tablets"
    case intestinalgel = "Intestinal gel"
    case skinpatch = "Skin patch"
    case injection = "Intermittent injection"
    case infusion = "Continuous infusion pump"
}
