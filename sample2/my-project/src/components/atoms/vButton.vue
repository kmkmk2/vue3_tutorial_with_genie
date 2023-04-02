<template>
  <button class="btn" @click="$emit('click')">{{ label }}</button>
</template>

<script>
export default {
  props: {
    label: {
      type: String,
      required: true,
    },
  },
};
</script>

<style scoped>
.btn {
  background-color: #337ab7;
  border-color: #2e6da4;
  color: #fff;
  cursor: pointer;
  font-size: 16px;
  padding: 6px 12px;
  text-align: center;
  text-decoration: none;
  vertical-align: middle;
  white-space: nowrap;
  user-select: none;
  border-radius: 5px;

  &:hover {
    background-color: #286090;
    border-color: #204d74;
  }
}
</style>
