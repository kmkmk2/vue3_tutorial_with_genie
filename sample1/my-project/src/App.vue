<template>
  <div class="container">
    <h1>Vue Counter App</h1>
    <p>Count: {{ count }}</p>
    <button @click="increment">+</button>
    <button @click="decrement">-</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      count: 0,
    };
  },
  methods: {
    increment() {
      this.count++;
    },
    decrement() {
      if (this.count > 0) {
        this.count--;
      }
    },
  },
};
</script>

<style scoped>
.container {
  width: 300px;
  max-width: 100%;
  margin: auto;
  text-align: center;
}
</style>
