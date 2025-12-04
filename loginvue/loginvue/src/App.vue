<!-- src/App.vue -->
<template>
  <div class="app-container">
    <!-- 背景图案 -->
    <div class="bg-pattern"></div>
    
    <!-- 导航栏 -->
    <nav class="navbar">
      <div class="logo">AuthSystem</div>
      <div class="nav-user" v-if="isLoggedIn">
        <div class="avatar">{{ userInitial }}</div>
      </div>
    </nav>
    
    <!-- 主内容区 -->
    <div class="main-content">
      <router-view />
    </div>
  </div>
</template>

<script setup>
import { computed } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()

// 检查登录状态
const isLoggedIn = computed(() => {
  return localStorage.getItem('user') !== null
})

// 获取用户名称首字母
const userInitial = computed(() => {
  if (isLoggedIn.value) {
    const user = JSON.parse(localStorage.getItem('user'))
    return user.username ? user.username.charAt(0).toUpperCase() : 'U'
  }
  return 'U'
})
</script>

<style>
/* 引入全局样式 */
@import './assets/global.css';

.app-container {
  min-height: 100vh;
}
</style>