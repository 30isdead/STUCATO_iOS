//
//  StudyCafeDataManager.swift
//  STUCATO
//
//  Created by Seyoung on 12/20/23.
//

import Foundation
import Alamofire

class StudyCafeDataManager {
    func studyCafeDataManager( _ viewController : InfoViewController) {
        AF.request(APIConstants.getInfoURL, method: .get, parameters: nil).validate().responseDecodable(of: StudyCafeDataModel.self) { response in
            switch response.result {
            case .success(let result):
                viewController.successAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
