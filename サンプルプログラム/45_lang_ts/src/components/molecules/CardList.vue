<template>
  <div class="card-list">
    <SearchBox @search="onSearch" />
    <div class="card-grid">
      <Card v-for="card in filteredCards" :key="card.id" :title="card.title" :description="card.description" :image="card.image" />
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue';
import Card from '@/components/atoms/vCard.vue';
import SearchBox from '@/components/molecules/SearchBox.vue';

const searchText = ref('');
const cards = [
  {
    id: 1,
    title: 'Card 1',
    description: 'Description for card 1.',
    image: 'https://picsum.photos/id/237/200/300',
  },
  {
    id: 2,
    title: 'Card 2',
    description: 'Description for card 2.',
    image: 'https://picsum.photos/id/238/200/300',
  },
  {
    id: 3,
    title: 'Card 3',
    description: 'Description for card 3.',
    image: 'https://picsum.photos/id/239/200/300',
  },
];

function onSearch(s_searchText: string) {
  searchText.value = s_searchText;
}

const filteredCards = computed(() => {
  if (searchText.value) {
    return cards.filter((card) => {
      return (
        card.title.toLowerCase().includes(searchText.value.toLowerCase()) ||
        card.description.toLowerCase().includes(searchText.value.toLowerCase())
      );
    });
  } else {
    return cards;
  }
});
</script>

<style scoped>
.card-list {
  max-width: 700px;
  margin: auto;
  text-align: center;
}

.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  grid-gap: 20px;
}
</style>