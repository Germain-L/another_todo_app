<template>
  <div id="app" class="row">
    <div class="center">
      <Title />
    </div>
  </div>
</template>

<script>
import Title from "./components/Title.vue";

export default {
  name: "App",
  components: {
    Title,
  },
};
</script>

<style>
#app {
  height: 100vh;
  font-family: 'poppinsbold';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  background-color: #002859;
}

html,
body {
  padding: 0;
  margin: 0;
}

.row {
  display: flex;
  flex-direction: row;
}

.column {
  display: flex;
  flex-direction: column;
}

.wrap {
  flex-wrap: wrap;
}

.center {
  display: flex;
  justify-content: center;
  align-items: center;
}

@media only screen and (min-width: 1280px) {
  /* For wide screens: */
  .xLarge-1 {
    width: 8.33%;
  }
  .xLarge-2 {
    width: 16.66%;
  }
  .xLarge-3 {
    width: 25%;
  }
  .xLarge-4 {
    width: 33.33%;
  }
  .xLarge-5 {
    width: 41.66%;
  }
  .xLarge-6 {
    width: 50%;
  }
  .xLarge-7 {
    width: 58.33%;
  }
  .xLarge-8 {
    width: 66.66%;
  }
  .xLarge-9 {
    width: 75%;
  }
  .xLarge-10 {
    width: 83.33%;
  }
  .xLarge-11 {
    width: 91.66%;
  }
  .xLarge-12 {
    width: 100%;
  }

  .end {
    align-items: flex-end;
  }
}

@media only screen and (min-width: 980px) and (max-width: 1279px) {
  /* For desktop: */
  .large-1 {
    width: 8.33%;
  }
  .large-2 {
    width: 16.66%;
  }
  .large-3 {
    width: 25%;
  }
  .large-4 {
    width: 33.33%;
  }
  .large-5 {
    width: 41.66%;
  }
  .large-6 {
    width: 50%;
  }
  .large-7 {
    width: 58.33%;
  }
  .large-8 {
    width: 66.66%;
  }
  .large-9 {
    width: 75%;
  }
  .large-10 {
    width: 83.33%;
  }
  .large-11 {
    width: 91.66%;
  }
  .large-12 {
    width: 100%;
  }

  .end {
    align-items: flex-end;
  }
}

@media only screen and (min-width: 520px) and (max-width: 979px) {
  /* For tablets: */
  .medium-1 {
    width: 8.33%;
  }
  .medium-2 {
    width: 16.66%;
  }
  .medium-3 {
    width: 25%;
  }
  .medium-4 {
    width: 33.33%;
  }
  .medium-5 {
    width: 41.66%;
  }
  .medium-6 {
    width: 50%;
  }
  .medium-7 {
    width: 58.33%;
  }
  .medium-8 {
    width: 66.66%;
  }
  .medium-9 {
    width: 75%;
  }
  .medium-10 {
    width: 83.33%;
  }
  .medium-11 {
    width: 91.66%;
  }
  .medium-12 {
    width: 100%;
  }

  .end {
    align-items: center;
  }
}

@media only screen and (min-width: 260px) and (max-width: 519px) {
  /* For mobile: */
  .small-1 {
    width: 8.33%;
  }
  .small-2 {
    width: 16.66%;
  }
  .small-3 {
    width: 25%;
  }
  .small-4 {
    width: 33.33%;
  }
  .small-5 {
    width: 41.66%;
  }
  .small-6 {
    width: 50%;
  }
  .small-7 {
    width: 58.33%;
  }
  .small-8 {
    width: 66.66%;
  }
  .small-9 {
    width: 75%;
  }
  .small-10 {
    width: 83.33%;
  }
  .small-11 {
    width: 91.66%;
  }
  .small-12 {
    width: 100%;
  }

  .end {
    align-items: center;
  }
}

@media only screen and (max-width: 259px) {
  /* For watch: */
  .xSmall-1 {
    width: 8.33%;
  }
  .xSmall-2 {
    width: 16.66%;
  }
  .xSmall-3 {
    width: 25%;
  }
  .xSmall-4 {
    width: 33.33%;
  }
  .xSmall-5 {
    width: 41.66%;
  }
  .xSmall-6 {
    width: 50%;
  }
  .xSmall-7 {
    width: 58.33%;
  }
  .xSmall-8 {
    width: 66.66%;
  }
  .xSmall-9 {
    width: 75%;
  }
  .xSmall-10 {
    width: 83.33%;
  }
  .xSmall-11 {
    width: 91.66%;
  }
  .xSmall-12 {
    width: 100%;
  }

  .end {
    align-items: center;
  }
}

@font-face {
  font-family: "poppinsbold";
  src: url("./assets/poppins-bold-webfont.woff2") format("woff2"),
    url("./assets/poppins-bold-webfont.woff") format("woff");
  font-weight: normal;
  font-style: normal;
}

@font-face {
  font-family: "poppinsitalic";
  src: url("./assets/poppins-italic-webfont.woff2") format("woff2"),
    url("./assets/poppins-italic-webfont.woff") format("woff");
  font-weight: normal;
  font-style: normal;
}

@font-face {
  font-family: "poppinsregular";
  src: url("./assets/poppins-regular-webfont.woff2") format("woff2"),
    url("./assets/poppins-regular-webfont.woff") format("woff");
  font-weight: normal;
  font-style: normal;
}
</style>
