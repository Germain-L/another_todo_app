<template>
  <a
    href="https://play.google.com/store/apps/details?id=com.germainleignel.another_todo_app"
    class="card center"
    target="_blank"
  >
    <div>
      <h2>Available soon</h2>
    </div>
  </a>
</template>

<script>
export default {
  name: "d-Button",
};
</script>

<style scoped>
.card {
  background-color: #1e88e5;
  box-shadow: 0 3px 1px -2px rgba(0, 0, 0, 0.5), 0 2px 2px 0 rgba(0, 0, 0, 0.5),
    0 1px 5px 0 rgba(0, 0, 0, 0.5);
  transition: 0.1s;
  border-radius: 10px; /* 5px rounded corners */
  width: 350px;
  height: 100%;
}

.card:hover {
  box-shadow: 0 9px 3px -6px rgba(0, 0, 0, 0.5), 0 6px 6px 0 rgba(0, 0, 0, 0.5),
    0 3px 15px 0 rgba(0, 0, 0, 0.5);
}

.card:active {
  box-shadow: none;
}

a {
  text-decoration: none;
  color: #eeeeee;
}
</style>
