<template>
  <div class="color-change">{{msg}}</div>
</template>
<script>
/* Option API pattern */
export default {
  name: 'HelloWorld',
  data() {
    return {
      msg: 'Welcome to Vue 3!'
    }
  }
}
/* Composition API pattern */
/*
import { reactive } from 'vue';

export default {
  setup() {
    const state = reactive({
      msg: 'Welcome to Vue 3!'
    });

    return state;
  }
}*/
</script>
<style>
.color-change {
  color: red;
}
</style>