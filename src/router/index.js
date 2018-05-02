import Vue from 'vue'
import Router from 'vue-router'
import GoodsList from '../views/GoodsList.vue'
import Props from '../../demo/props.vue'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'GoodsList',
      component: GoodsList,
    },
    {
      path: '/props',
      name: 'props',
      component: Props,
    }
  ]
})
