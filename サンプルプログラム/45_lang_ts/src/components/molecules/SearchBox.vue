<template>
  <div class="search-box">
    <input type="text" :value="searchText" @input="onInput" placeholder="Search..." />
    <Button label="Search" @click="onSearch" />
  </div>
</template>

<script setup lang="ts">
import { ref, defineEmits } from 'vue';
import Button from '@/components/atoms/vButton.vue';

const emit = defineEmits(['search']);
const searchText = ref('');

function onInput(event: Event) {
  searchText.value = (event.target as HTMLInputElement).value;
}

function onSearch() {
  emit('search', searchText.value);
}
</script>

<style scoped>
.search-box {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
}

.search-box input {
  border-radius: 5px;
  border: none;
  box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 2px;
  height: 36px;
  padding: 6px;
  width: 70%;
}
</style>