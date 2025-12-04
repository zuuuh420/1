<!-- src/views/Register.vue -->
<template>
  <div class="card">
    <h1 class="card-title">创建账户</h1>
    <p class="card-subtitle">注册一个新账户开始使用</p>
    
    <div class="message message-error" v-if="errorMsg">{{ errorMsg }}</div>
    <div class="message message-success" v-if="successMsg">{{ successMsg }}</div>
    
    <form @submit.prevent="handleRegister">
      <div class="form-group">
        <label class="form-label">用户名</label>
        <input type="text" class="form-input" v-model="user.username" required placeholder="请设置用户名">
      </div>
      <div class="form-group">
        <label class="form-label">密码</label>
        <input type="password" class="form-input" v-model="user.password" required placeholder="请设置密码">
      </div>
      <div class="form-group">
        <label class="form-label">确认密码</label>
        <input type="password" class="form-input" v-model="confirmPassword" required placeholder="请确认密码">
      </div>
      <button type="submit" class="btn btn-primary" :disabled="loading">
        {{ loading ? '注册中...' : '注册' }}
      </button>
    </form>
    
    <p class="switch-text">
      已有账户？<span class="switch-link" @click="$router.push('/login')">立即登录</span>
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
      confirmPassword: '',
      loading: false,
      errorMsg: '',
      successMsg: ''
    }
  },
  methods: {
    async handleRegister() {
      if (this.user.password !== this.confirmPassword) {
        this.errorMsg = '两次输入的密码不一致'
        return
      }
      
      this.loading = true
      this.errorMsg = ''
      this.successMsg = ''
      
      try {
        const response = await api.register(this.user)
        if (response.data.success) {
          this.successMsg = '注册成功，请登录'
          setTimeout(() => {
            this.$router.push('/login')
          }, 1500)
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
button:disabled {
  opacity: 0.7;
  cursor: not-allowed;
}
</style>