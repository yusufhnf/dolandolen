//
//  FavouriteInteractor.swift
//  dolandolen
//
//  Created by Yusuf Umar Hanafi on 28/11/21.
//

import Foundation
import RxSwift

protocol FavouriteUseCase {
    func getFavouritesData() -> Observable<[GameFavoriteModel]>
}
class FavouriteInteractor: FavouriteUseCase {
    private let favouriteRepository: FavouriteRepository
    required init(favouriteRepository: FavouriteRepository) {
        self.favouriteRepository = favouriteRepository
    }
    func getFavouritesData() -> Observable<[GameFavoriteModel]> {
        return self.favouriteRepository.getFavouritesData()
    }
}
