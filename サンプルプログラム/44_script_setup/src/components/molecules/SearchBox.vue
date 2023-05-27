<template>
  <div class="search-box">
    <input type="text" :value="searchText" @input="onInput" placeholder="Search..." />
    <Button label="Search" @click="onSearch" />
  </div>
</template>

<script setup>
import { ref, defineEmits } from 'vue';
import Button from '@/components/atoms/vButton.vue';

const searchText = ref('');
const emits = defineEmits(['search']);

function onInput(event) {
  searchText.value = event.target.value;
}

function onSearch() {
  emits('search', searchText);
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
