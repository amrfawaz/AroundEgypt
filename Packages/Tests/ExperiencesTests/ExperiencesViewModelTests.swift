//
//  ExperiencesViewModelTests.swift
//  
//
//  Created by Amr Abd-Elhakim on 21/03/2025.
//

import XCTest
import Combine

@testable import Experiences
@testable import SharedModels
@testable import Networking

final class ExperiencesViewModelTests: XCTestCase {
    var sut: ExperiencesViewModel!
    var mockUseCase: MockFetchExperiencesUseCase!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        mockUseCase = MockFetchExperiencesUseCase(repository: MockExperienceRepository())
        sut = ExperiencesViewModel(experiencesUseCase: mockUseCase)
        cancellables = []
    }

    override func tearDown() {
        sut = nil
        mockUseCase = nil
        cancellables = nil
        super.tearDown()
    }

    private func makeExperiencesResponse() -> Data {
        let experiences = Experience.mockedExperiences
        let response = FetchExperiencesResponse(data: experiences)
        return try! JSONEncoder().encode(response)
    }

    private func makeLikeResponse(success: Bool) -> Data {
        let response = LikeExperienceResponse(data: 10)
        return try! JSONEncoder().encode(response)
    }

    // MARK: - Fetch Experiences Tests
    
    func testFetchRecentExperiences_Success() async {
        // Given
        let expectation = XCTestExpectation(description: "Loading state")
        mockUseCase.responseData = makeExperiencesResponse()
        
        // When
        Task {
            await sut.fetchExperiences(category: .recent)
            expectation.fulfill()
        }
        
        // Then
        await fulfillment(of: [expectation], timeout: 1.0)
        XCTAssertEqual(sut.recentExperiences.count, 5)
        XCTAssertTrue(sut.errorMessage.isEmpty)
        XCTAssertFalse(sut.isLoading)
    }

    func testFetchRecommendedExperiences_Success() async {
        // Given
        let expectation = XCTestExpectation(description: "Loading state")
        mockUseCase.responseData = makeExperiencesResponse()
        
        // When
        Task {
            await sut.fetchExperiences(category: .recommended)
            expectation.fulfill()
        }
        
        // Then
        await fulfillment(of: [expectation], timeout: 1.0)
        XCTAssertEqual(sut.recommendedExperiences.count, 5)
        XCTAssertTrue(sut.errorMessage.isEmpty)
        XCTAssertFalse(sut.isLoading)
    }

    func testFetchExperiences_NoDataError() async {
        // Given
        let expectation = XCTestExpectation(description: "Loading state")
        mockUseCase.responseData = nil
        
        // When
        Task {
            await sut.fetchExperiences(category: .recent)
            expectation.fulfill()
        }
        
        // Then
        await fulfillment(of: [expectation], timeout: 1.0)
        XCTAssertTrue(sut.recentExperiences.isEmpty)
        XCTAssertFalse(sut.isLoading)
    }
    
    func testFetchExperiences_DecodingError() async {
        // Given
        mockUseCase.responseData = "invalid json".data(using: .utf8)
        
        // When
        await sut.fetchExperiences(category: .recent)
        
        // Then
        XCTAssertTrue(sut.recentExperiences.isEmpty)
    }
    
    func testFetchExperiences_ServerError() async {
        // Given
        mockUseCase.responseError = .serverError
        
        // When
        await sut.fetchExperiences(category: .recent)
        
        // Then
        XCTAssertTrue(sut.recentExperiences.isEmpty)
    }
    
    // MARK: - Like Experience Tests
    
    func testLikeExperience_Success() async {
        // Given
        mockUseCase.responseData = makeLikeResponse(success: true)
        
        // When
        await sut.likeExperience(id: "test_id")
        
        // Then
        XCTAssertTrue(sut.errorMessage.isEmpty)
    }
    
    // MARK: - Loading State Tests
    
    func testLoadingState_DuringFetch() async {
        // Given
        let expectation = XCTestExpectation(description: "Loading state")
        mockUseCase.responseData = makeExperiencesResponse()
        
        // When
        Task {
            await sut.fetchExperiences(category: .recent)
            XCTAssertTrue(sut.isLoading)

            expectation.fulfill()
        }
        
        // Then
        await fulfillment(of: [expectation], timeout: 1.0)
        XCTAssertFalse(sut.isLoading)
    }
    
    func testSkipFetch_WhileLoading() async {
        // Given
        sut.isLoading = true
        mockUseCase.responseData = makeExperiencesResponse()
        
        // When
        await sut.fetchExperiences(category: .recent)
        
        // Then
        XCTAssertTrue(sut.recentExperiences.isEmpty)
    }
}
