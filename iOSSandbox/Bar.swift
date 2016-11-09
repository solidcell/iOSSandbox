import RealmSwift

class Bar {

    weak var delegate: BarDelegate?
    private var token: NotificationToken?
    private let realm = try! Realm()
    private let results: Results<Thing>

    init() {
        self.results = realm.objects(Thing.self)
    }

    func start() {
        self.token = results.addNotificationBlock { [weak self] changes in
            switch changes {
            case .update(let results,
                         deletions: let deletions,
                         insertions: let insertions,
                         modifications: let modifications):
                self?.handleUpdate(results: results,
                                   deletions: deletions,
                                   insertions: insertions,
                                   modifications: modifications)
            default:
                fatalError("other enum values are not handled for the sake of this example")
            }
        }
    }

    private func handleUpdate(results: Results<Thing>,
                              deletions: [Int],
                              insertions: [Int],
                              modifications: [Int]) {
        if insertions.isEmpty { return }
        let things = insertions.map { index in
            return results[index]
        }
        self.delegate?.thingsAdded(things: things)
    }
    
}

protocol BarDelegate: class {
    func thingsAdded(things: [Thing])
}
