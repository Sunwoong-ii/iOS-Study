import RxSwift

let disposeBag = DisposeBag()

print("-----ignoreElements-----")
let sleepMode = PublishSubject<String>()

sleepMode
    .ignoreElements()
    .subscribe {
        print($0.element ?? $0)
    }
    .disposed(by: disposeBag)

sleepMode.onNext("🔊")
sleepMode.onNext("🔊")
sleepMode.onNext("🔊")

sleepMode.onCompleted()

print("-----elementAt-----")
let wakeUp = PublishSubject<String>()
wakeUp
    .element(at: 0)
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

wakeUp.onNext("1")
wakeUp.onNext("2")
wakeUp.onNext("3")
wakeUp.onNext("4")

print("-----filter-----")
Observable.of(1,2,3,4,5,6,7,8)
    .filter {
        $0 % 2 == 0
    }
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)

print("-----skip-----")
Observable.of(1,2,3,4,5,6,7)
    .skip(5)
    .subscribe{
        print($0)
    }
    .disposed(by: disposeBag)

print("-----skipWhile-----")
Observable.of(1,2,3,4,5,6,7,8)
    .skip {
        $0 != 4
    }
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)

print("-----skipUntil-----")
let people1 = PublishSubject<String>()
let people2 = PublishSubject<String>()

people1
    .skip(until: people2)
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)

people1.onNext("hello")
people1.onNext("hi")

people2.onNext("myname~")
people1.onNext("wow")

print("-----take-----")
Observable.of(1,2,3,4,5)
    .take(3)
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)

print("-----takeWhile-----")
Observable.of(1,2,3,4,5)
    .take(while: {
        $0 != 3
    })
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

print("-----takeUntil-----")
let ob1 = PublishSubject<Int>()
let ob2 = PublishSubject<Int>()

ob1.take(until: ob2)
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)

ob1.onNext(1)
ob1.onNext(2)

ob2.onNext(1)
ob1.onNext(3)


print("-----enumerated-----")
Observable.of(1,2,3,4,5)
    .enumerated()
    .takeWhile{
        $0.index < 3
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

// 연달아 반복 된것만 스킵.
print("-----distinctUntilChanged-----")
Observable.of(1, 1, 2, 2, 3, 2, 3, 1, 4, 5, 5, 6)
    .distinctUntilChanged()
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)

