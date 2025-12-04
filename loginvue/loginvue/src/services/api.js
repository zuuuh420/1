import axios from 'axios'

const api = axios.create({
    baseURL: 'http://localhost:9090',  // 后端API地址
    headers: {
        'Content-Type': 'application/json'
    }
})

// 请求拦截器
api.interceptors.request.use(config => {
    // 可以添加token等认证信息
    return config
})

export default {
    // 用户登录
    login(user) {
        return api.post('/user/login', user)
    },
    // 用户注册
    register(user) {
        return api.post('/user/regist', user)
    }
}