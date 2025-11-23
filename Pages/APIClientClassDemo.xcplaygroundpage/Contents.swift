//: [Previous](@previous)

import Foundation

class APIClient {
    
    // attribute
    private var baseURL: String
    private var token: String?
    
    // compute attribute
    var isLoggedIn: Bool {
        token != nil
    }
    
    // 类型属性：统计所有 APIClient 实例总共发出的请求数（全局共享）
    static var totalRequestCount = 0
    
    init(baseURL: String, token: String? = nil) {
        self.baseURL = baseURL
        self.token = token
        print("APIClient 初始化完成")
    }
    
    // method: login
    func login(username: String, password: String) {
        self.token = "mock_token_123"
        print("登录成功")
    }
    
    // method: request
    func request(endpoint: String) {
        guard isLoggedIn else {
            print("未登录，无法请求")
            return
        }
            
        APIClient.totalRequestCount += 1
        print("请求 \(baseURL)/\(endpoint)，当前 token：\(token!)")
    }
    
    // deinit
    deinit {
        print("APIClient 被销毁")
    }
}

var client: APIClient? = APIClient(baseURL: "https://api.example.com")
client?.login(username: "admin", password: "123456")
client?.request(endpoint: "user/profile")

print(APIClient.totalRequestCount)  // 1

client = nil  // 会触发 deinit

