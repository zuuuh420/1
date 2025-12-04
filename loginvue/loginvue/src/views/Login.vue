<!-- src/views/Login.vue -->
<template>
  <div class="card">
    <h1 class="card-title">欢迎回来</h1>
    <p class="card-subtitle">登录您的账户继续</p>
    
    <div class="message message-error" v-if="errorMsg">{{ errorMsg }}</div>
    
    <form @submit.prevent="handleLogin">
      <div class="form-group">
        <label class="form-label">用户名</label>
        <input type="text" class="form-input" v-model="user.username" required placeholder="请输入用户名">
      </div>
      <div class="form-group">
        <label class="form-label">密码</label>
        <input type="password" class="form-input" v-model="user.password" required placeholder="请输入密码">
      </div>
      <button type="submit" class="btn btn-primary" :disabled="loading">
        {{ loading ? '登录中...' : '登录' }}
      </button>
    </form>
    
    <p class="switch-text">
      还没有账户？<span class="switch-link" @click="$router.push('/register')">立即注册</span>
    </p>
  </div>
</template>

<script>
import api from '../services/api'

export default {
  data() {
    return {
      user: {
        username: '',
        password: ''
      },
      loading: false,
      errorMsg: ''
    }
  },
  methods: {
    async handleLogin() {
      this.loading = true
      this.errorMsg = ''
      
      try {
        const response = await api.login(this.user)
        if (response.data.success) {
          // 保存用户信息到本地存储
          localStorage.setItem('user', JSON.stringify(response.data.detail))
          this.$router.push('/profile')
        } else {
          this.errorMsg = response.data.msg
        }
      } catch (error) {
        this.errorMsg = '网络错误，请稍后重试'
      } finally {
        this.loading = false
      }
    }
  }
}
</script>

<style scoped>
/* 局部样式可以覆盖全局样式 */
button:disabled {
  opacity: 0.7;
  cursor: not-allowed;
}
</style>