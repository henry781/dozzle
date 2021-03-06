import Vue from "vue";
import VueRouter from "vue-router";
import vueHeadful from "vue-headful";
import App from "./App.vue";
import Container from "./pages/Container.vue";
import Index from "./pages/Index.vue";

Vue.use(VueRouter);
Vue.component("vue-headful", vueHeadful);

const routes = [
  {
    path: "/",
    component: Index,
    name: "default"
  },
  {
    path: "/container/:id",
    component: Container,
    name: "container",
    props: true
  }
];

const router = new VueRouter({
  mode: "history",
  base: BASE_PATH + "/",
  routes
});

new Vue({
  router,
  render: h => h(App)
}).$mount("#app");
