import XCTest
@testable import Pressurelog

@MainActor
final class PressurelogTests: XCTestCase {
    func makeIsolatedStore() -> Store {
        Store()
    }

    func testSeedDataUnderFreeLimit() {
        let store = makeIsolatedStore()
        XCTAssertLessThan(Store.seedData().count, Store.freeLimit)
    }

    func testAddIncreasesCount() {
        let store = makeIsolatedStore()
        let before = store.items.count
        let added = store.add(CookLog())
        XCTAssertTrue(added)
        XCTAssertEqual(store.items.count, before + 1)
    }

    func testDeleteRemovesItem() {
        let store = makeIsolatedStore()
        let item = CookLog()
        store.add(item)
        store.delete(item)
        XCTAssertFalse(store.items.contains(item))
    }

    func testCanAddMoreWhenUnderLimit() {
        let store = makeIsolatedStore()
        store.items = []
        XCTAssertTrue(store.canAddMore)
    }

    func testCannotAddMoreAtLimitWhenNotPro() {
        let store = makeIsolatedStore()
        store.isPro = false
        store.items = Array(repeating: CookLog(), count: Store.freeLimit)
        XCTAssertFalse(store.canAddMore)
        XCTAssertFalse(store.add(CookLog()))
    }

    func testProBypassesLimit() {
        let store = makeIsolatedStore()
        store.isPro = true
        store.items = Array(repeating: CookLog(), count: Store.freeLimit)
        XCTAssertTrue(store.canAddMore)
        XCTAssertTrue(store.add(CookLog()))
    }

    func testUpdateModifiesExistingItem() {
        let store = makeIsolatedStore()
        var item = CookLog()
        store.add(item)
        item.dish = "Updated"
        store.update(item)
        XCTAssertEqual(store.items.first(where: { $0.id == item.id })?.dish, "Updated")
    }

    func testDeleteAtOffsets() {
        let store = makeIsolatedStore()
        store.items = [CookLog(), CookLog()]
        store.delete(at: IndexSet(integer: 0))
        XCTAssertEqual(store.items.count, 1)
    }
}
