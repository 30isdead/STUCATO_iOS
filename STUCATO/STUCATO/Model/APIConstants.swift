//
//  APIConstants.swift
//  STUCATO
//
//  Created by Seyoung on 12/20/23.
//

import Foundation

struct APIConstants {
    //MARK: - Base URL
    static let baseURL = ""

    //MARK: - Feature URL
    // 랜딩 페이지 URL
    static let postLandingURL = baseURL + "/home/rating"
    // 로그인 페이지 URL
    static let postUserURL = baseURL + "/users"
    // 스터디 카페 정보 가져오기 URL
    static let getInfoURL = baseURL + "/home/{cafeid}/home"
    // 스터디 카페 사진 가져오기 URL
    //static let getPictureURL = baseURL + "/home/{cafeid}/pictures"
    // 스터디 카페 예약 정보 페이지 URL
    static let getReserveURL = baseURL + "/home/{cafeid}/book"
    // 스터디 카페 예약 페이지 URL
    static let postReserveURL = baseURL + "/home/{cafeid}/book"
    // 일정 선택 화면 URL
    static let getCalenderURL = baseURL + "/home/{cafeId}/book/{seatId}"
    // 일정 선택 가져오기 URL
    static let postCalenderURL = baseURL + "/home/{cafeId}/book/{seatId}"
    // 마이페이지 URL
    static let getMypageURL = baseURL + "/home/{cafeId}/book/{seatId}"
}
