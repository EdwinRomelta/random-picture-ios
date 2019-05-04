//
//  LoginViewModel.swift
//  presenter
//
//  Created by ImNotPro on 01/05/19.
//

import domain
import RxSwift
import RxCocoa
import Cleanse

private let VALIDATION_EMPTY_EMAIL = 0b1
private let VALIDATION_EMPTY_PASSWORD = 0b10
private let VALIDATION_INVALID_EMAIL = 0b100

public class LoginViewModel : BaseViewModel{
    
    public let loginResponse : Driver<Resource<Void>>
    private let dispose = DisposeBag()
    
    private let login : Login
    private let loginResponsePublisher : PublishSubject<Resource<Void>>
    
    public init(login : Login) {
        self.login = login
        
        loginResponsePublisher = PublishSubject.init()
        loginResponsePublisher.onNext(Resource.loading())
        loginResponse = loginResponsePublisher.asDriver(onErrorJustReturn: Resource<Void>.error(error: DialogErrorResource("Oops, something went wrong")))
    }
    
    public func doLogin(_ email: String,_ password: String) {
        loginResponsePublisher.onNext(Resource.loading())
        var validation = 0
        if (email.isEmpty) {
            validation = validation | VALIDATION_EMPTY_EMAIL
        }
        if (password.isEmpty) {
            validation = validation | VALIDATION_EMPTY_PASSWORD
        }
        if (!email.isEmail) {
            validation = validation | VALIDATION_INVALID_EMAIL
        }
        if (validation > 0) {
            loginResponsePublisher.onNext(Resource<Void>.error(error: DialogErrorResource("Oops, something went wrong")))
        } else {
            self.compositeDisposable.insert(login.execute(completableObserver: loginSubscriber(event:), params: LoginParam(email, password)))
        }
    }
    
    private func loginSubscriber(event: CompletableEvent){
        switch event {
            case .completed:
                loginResponsePublisher.onNext(Resource<Void>.success(data: ()))
            case .error(_):
                loginResponsePublisher.onNext(Resource<Void>.error(error: DialogErrorResource("Oops, something went wrong")))
        }
    }
}
