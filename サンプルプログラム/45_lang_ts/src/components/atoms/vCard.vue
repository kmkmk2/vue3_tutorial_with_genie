<template>
  <div class="card">
    <img :src="props.image" alt="card image" />
    <h3>{{ props.title }}</h3>
    <p>{{ props.description }}</p>
  </div>
</template>

<script lang="ts" setup>
import { defineProps } from 'vue';

interface Props {
  title: string;
  description: string;
  image: string;
}

const props = defineProps<Props>();

// 以下の書き方は、必須かどうかを示したい場合
// const props = defineProps<Props>({
//   title: {
//     type: String,
//     required: true,
//   },
//   description: {
//     type: String,
//     required: true,
//   },
//   image: {
//     type: String,
//     required: true,
//   },
// });
</script>

<style scoped>
.card {
  border: 1px solid #ddd;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  padding: 10px;
  text-align: center;
}

.card img {
  max-width: 100%;
}
</style>