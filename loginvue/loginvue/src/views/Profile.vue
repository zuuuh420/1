<!-- src/views/Profile.vue -->
<template>
  <div class="card profile-card">
    <div class="profile-avatar">{{ userInitial }}</div>
    <h2 class="profile-name">{{ user.username }}</h2>
    <p class="profile-info">ID: {{ user.id }}</p>
    
    <div class="profile-stats">
      <div class="stat-item">
        <div class="stat-value">0</div>
        <div class="stat-label">文章</div>
      </div>
      <div class="stat-item">
        <div class="stat-value">0</div>
        <div class="stat-label">评论</div>
      </div>
      <div class="stat-item">
        <div class="stat-value">0</div>
        <div class="stat-label">收藏</div>
      </div>
    </div>
    
    <button class="btn btn-logout" @click="handleLogout">退出登录</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      user: {}
    }
  },
  computed: {
    userInitial() {
      return this.user.username ? this.user.username.charAt(0).toUpperCase() : 'U'
    }
  },
  created() {
    // 检查登录状态
    const savedUser = localStorage.getItem('user')
    if (!savedUser) {
      this.$router.push('/login')
      return
    }
    this.user = JSON.parse(savedUser)
  },
  methods: {
    handleLogout() {
      localStorage.removeItem('user')
      this.$router.push('/login')
    }
  }
}
</script>

<style scoped>
.profile-card {
  text-align: center;
}

.profile-avatar {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  background: linear-gradient(135deg, var(--primary), var(--accent));
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 42px;
  font-weight: 700;
  margin: 0 auto 24px;
  box-shadow: 0 10px 40px rgba(99, 102, 241, 0.3);
}

.profile-name {
  font-size: 28px;
  font-weight: 700;
  margin-bottom: 8px;
}

.profile-info {
  color: var(--text-muted);
  margin-bottom: 32px;
}

.profile-stats {
  display: flex;
  justify-content: center;
  gap: 40px;
  margin-bottom: 32px;
  padding: 24px;
  background: rgba(15, 23, 42, 0.5);
  border-radius: 16px;
}

.stat-item {
  text-align: center;
}

.stat-value {
  font-size: 24px;
  font-weight: 700;
  color: var(--primary);
}

.stat-label {
  font-size: 12px;
  color: var(--text-muted);
  margin-top: 4px;
}
</style>