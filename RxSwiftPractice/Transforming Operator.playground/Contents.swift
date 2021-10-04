import RxSwift

let disposBag = DisposeBag()

print("-----toArray-----")
Observable.of("A", "B", "C")
    .toArray()
    .subscribe(onSuccess: {
        print($0)
    })
    .disposed(by: disposBag)

print("-----map-----")
Observable.of(Date())
    .map { date -> String in
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: date)
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposBag)

print("-----flatMap-----")
protocol Player {
    var point: BehaviorSubject<Int> { get }
}

struct SoccerPlayer: Player {
    var point: BehaviorSubject<Int>
}

let kor = SoccerPlayer(point: BehaviorSubject<Int>(value: 10))
let usa = SoccerPlayer(point: BehaviorSubject<Int>(value: 8))

let worldCup = PublishSubject<SoccerPlayer>()

worldCup
    .flatMap { palyer in
        palyer.point
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposBag)

worldCup.onNext(kor)
kor.point.onNext(10)

worldCup.onNext(usa)
kor.point.onNext(10)
usa.point.onNext(9)

print("-----flatMapLatest-----")
struct BasketBallPlayer: Player {
    var point: BehaviorSubject<Int>
}

let newyork = BasketBallPlayer(point: BehaviorSubject(value: 71))
let texas = BasketBallPlayer(point: BehaviorSubject(value: 89))

let nba = PublishSubject<Player>()

nba
    .flatMapLatest { player in
        player.point
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposBag)

nba.onNext(newyork)
newyork.point.onNext(74)

// nba 에서는 texas가 최신 이므로 texas것만 방출된다.
nba.onNext(texas)
newyork.point.onNext(77)
texas.point.onNext(91)
texas.point.onNext(94)

print("-----meterialize and dematerialize-----")
enum Foul: Error {
    case yelloCard
    case redCard
}

struct Runner: Player {
    var point: BehaviorSubject<Int>
}

let woong = Runner(point: BehaviorSubject<Int>(value: 1))
let sol = Runner(point: BehaviorSubject<Int>(value: 0))

let run100M = BehaviorSubject<Player>(value: woong)

run100M
    .flatMapLatest { player in
        player.point
            .materialize()
    }
    .filter {
//        error를 가졌을때는 이 filter를 건너뛰어
        guard let error = $0.error else {
            return true
        }
        print(error)
//        에러 일땐 필터 통과 안됨.
        return false
    }
    .dematerialize()
    .subscribe {
        print($0)
    }
    .disposed(by: disposBag)

woong.point.onNext(2)
woong.point.onError(Foul.yelloCard)
woong.point.onNext(3)

run100M.onNext(sol)
sol.point.onNext(1)

print("-----전화번호 11자리-----")
let input = PublishSubject<Int?>()

let list: [Int] = [1]

input
    .flatMap {
        $0 == nil
        ? Observable.empty()
        : Observable.just($0)
    }
    .map { $0! }
    .skip(while: { $0 != 0 })
    .take(11)
    .toArray()
    .asObservable()
    .map {
        $0.map { "\($0)" }
    }
    .map { numbers in
        var numberList = numbers
        numberList.insert("-", at: 3) // 010-
        numberList.insert("-", at: 8) // 010-1234-
        let number = numberList.reduce(" ", +)
        return number
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposBag)

input.onNext(10)
input.onNext(0)
input.onNext(nil)
input.onNext(1)
input.onNext(0)
input.onNext(6)
input.onNext(4)
input.onNext(9)
input.onNext(6)
input.onNext(nil)
input.onNext(6)
input.onNext(6)
input.onNext(7)
input.onNext(9)
input.onNext(9)
input.onNext(9)

