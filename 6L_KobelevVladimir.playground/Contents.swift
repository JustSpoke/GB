import Foundation


struct Queue<T> {
    var elements: [T] = []
    
    mutating func enqueue(_ value: T) {
        elements.append(value)
    }
    mutating func dequeue() -> T? {
        if elements.isEmpty {
            return nil
        } else {
            let tempElement = elements.first
            elements.remove(at: 0)
            return tempElement
        }
    }
        var head: T? {
            return elements.first
        }
    var tail: T? {
        return elements.last
    }
    subscript(_ index: Int) -> T? {
        return (index < elements.count ? elements[index] : nil) // здесь тупил очень долго
    }
}
var que = Queue<String>()
que.enqueue("Olga")
que.enqueue("Den")
que.enqueue("Jack")
que.enqueue("John")
que.enqueue("George")
que.enqueue("Michael")
que.enqueue("Sam")

que.elements.sorted(by: <)
que.head
var sortedQue = que.elements.sorted(by: <)

if let que1 = que[7] {
    print("Next in queue is \(que1)")
} else {
    print("No such person is queue")
}

print(sortedQue)

var filteredQue = sortedQue.filter { word in return word.count >= 4}

print(filteredQue)
sortedQue.reverse()
print(filteredQue)
filteredQue.shuffle()
