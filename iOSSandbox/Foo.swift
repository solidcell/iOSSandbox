import RealmSwift

class Foo: BarDelegate {

    let bar = Bar()
    private(set) var timesReceivedDelegateCall = 0

    init() {
        bar.delegate = self
        bar.start()
    }

    func perform() {
        let realm = try! Realm()
        try! realm.write {
            realm.add(Thing())
        }
    }

    func thingsAdded(things: [Thing]) {
        timesReceivedDelegateCall += 1
    }

}
