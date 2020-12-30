<template>
  <div>
    <section class="row wrap center full">
      <div
        class="xLarge-7 large-7 medium-12 small-12 xSmall-12 column end"
        id="titleText"
      >
        <h1>Another Todo</h1>
        <Button />
      </div>
      <div class="xLarge-5 large-5 medium-12 small-12 xSmall-12">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width="350.7"
          height="268.599"
          viewBox="0 0 350.7 268.599"
          class="svgLogo"
        >
          <path
            d="M101,244.3s73.475,92.65,139.3,60,124-190.6,124-190.6L423,148.3S348.675,338,261,375,72.3,296.3,72.3,296.3Z"
            transform="translate(-72.3 -113.7)"
            fill="#64ffda"
          />
        </svg>
      </div>
      <!-- <a href="https://github.com/Germain-L/another_todo_app" target="_blank"
        >Github</a
      > -->
    </section>
  </div>
</template>

<script>
import Button from "./Download.vue";
export default {
  name: "Title",
  components: {
    Button,
  },
};
</script>

<style scoped>
h1 {
  color: #eeeeee;
  font-size: 80px;
}

.x-center {
  display: flex;
  flex-direction: row;
  align-items: center;
}

.full {
  width: 100vw;
}

.svgLogo {
  padding-top: 5%
}
</style>
