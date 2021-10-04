import RxSwift

let disposeBag = DisposeBag()

print("-----publishSubject-----")
let publishSubject = PublishSubject<String>()

publishSubject.onNext("1. 여러분 안녕하세요?")

let subscriber1 = publishSubject
    .subscribe(
        onNext: {
            print($0)
        })
//    .disposed(by: disposeBag)

publishSubject.onNext("2. 들리세요?")
publishSubject.onNext("3. 안들리시나요?")

subscriber1.dispose()

let subscriber2 = publishSubject
    .subscribe(
        onNext: {
            print($0)
        })

publishSubject.onNext("4. 저기요")
publishSubject.onCompleted()

publishSubject.onNext("5. 끝났나요")

subscriber2.dispose()

publishSubject
    .subscribe {
        print("세번째 구독:", $0.element ?? $0)
    }
    .disposed(by: disposeBag)

publishSubject.onNext("6. 찍히는감?")

print("-----behaviorSubject-----")
enum SubjectError:Error {
    case error1
}

let behaviorSubject = BehaviorSubject<String>(value: "초기 값")

behaviorSubject.onNext("1. 첫번째 값")

behaviorSubject.subscribe {
    print("첫 번째 구독", $0.element ?? $0)
}
.disposed(by: disposeBag)

//behaviorSubject.onError(SubjectError.error1)
behaviorSubject.onNext("2. 두 번째 값")

behaviorSubject.subscribe {
    print("두 번째 구독", $0.element ?? $0)
}
.disposed(by: disposeBag)

behaviorSubject.onNext("3. 두 번째 값")

// subscribe 밖에서도 값을 꺼낼 수 있다.
let value = try? behaviorSubject.value()
print(value)

print("-----ReplaySubject-----")
let replaySubject = ReplaySubject<String>.create(bufferSize: 2)

replaySubject.onNext("1. 여러분")
replaySubject.onNext("2. 힘내세요")
replaySubject.onNext("3. 어렵지만")

replaySubject.subscribe {
    print("첫 번째 구독", $0.element ?? $0)
}
.disposed(by: disposeBag)

replaySubject.subscribe {
    print("두 번째 구독", $0.element ?? $0)
}

replaySubject.onNext("4. 할수있어요.")

replaySubject.onNext("5. 어렵지만")
replaySubject.onError(SubjectError.error1)
replaySubject.dispose()

// dispose 후 구독 했으므로 에러
replaySubject.subscribe {
    print("세 번째 구독", $0.element ?? $0)
}