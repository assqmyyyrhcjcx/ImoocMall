<template>
  <div>
    <nav-header></nav-header>
    <nav-bread>
      <span slot="bread">Goods</span>
    </nav-bread>
    <div class="accessory-result-page accessory-page">
      <div class="container">
        <div class="filter-nav">
          <span class="sortby">Sort by:</span>
          <a href="javascript:void(0)" class="default cur">Default</a>
          <a href="javascript:void(0)" class="price" @click="sortGoods()">Price <svg class="icon icon-arrow-short"><use xlink:href="#icon-arrow-short"></use></svg></a>
          <a href="javascript:void(0)" class="filterby stopPop" @click="showFilterPop()">Filter by</a>
        </div>
        <div class="accessory-result">
          <!-- filter -->
          <div class="filter stopPop" id="filter" v-bind:class="{'filterby-show': filterBy}">
            <dl class="filter-price">
              <dt>Price:</dt>
              <dd><a href="javascript:void(0)" @click="priceChecked = 'all'" v-bind:class="{'cur': priceChecked == 'all'}">All</a></dd>
              <dd v-for="(price, index) in priceFilter">
                <a href="javascript:void(0)" @click="setPriceFilter(index)" v-bind:class="{'cur': priceChecked == index}">{{price.startPrice}} - {{price.endPrice}}</a>
              </dd>
            </dl>
          </div>

          <!-- search result accessories list -->
          <div class="accessory-list-wrap">
            <div class="accessory-list col-4">
              <ul>
                <li v-for="(item, index) in goodsList">
                  <div class="pic">
                    <a href="#"><img v-lazy="'/static/'+item.productImage" alt=""></a>
                  </div>
                  <div class="main">
                    <div class="name">{{item.productName}}</div>
                    <div class="price">{{item.salePrice}}</div>
                    <div class="btn-area">
                      <a href="javascript:;" class="btn btn--m">加入购物车</a>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div v-infinite-scroll="loadMore" infinite-scroll-disabled="busy" infinite-scroll-distance="30">
          ...
        </div>
      </div>
    </div>
    <div class="md-overlay" v-show="overLayFlag" @click="closePop()"></div>
    <nav-footer></nav-footer>
  </div>
</template>

<script>
  import "./../assets/css/base.css"
  import "./../assets/css/product.css"
  import "./../assets/css/checkout.css"
  import "./../assets/css/login.css"
  import NavHeader from "@/components/NavHeader.vue"
  import NavFooter from "@/components/NavFooter.vue"
  import NavBread from "@/components/NavBread.vue"
  import axios from "axios"
  export default {
    data() {
      return {
        goodsList: [],
        priceFilter: [
          {
            startPrice: 0,
            endPrice: 499,
          },
          {
            startPrice: 500,
            endPrice: 999
          },
          {
            startPrice: 1000,
            endPrice: 1999
          }
        ],
        page: 1,
        pageSize: 8,
        priceChecked: "all",
        filterBy: false,
        overLayFlag: false,
        sortFlag: true,
        busy: true
      }
    },
    components: {
      NavHeader,
      NavFooter,
      NavBread
    },
    mounted() {
      this.getGoodsList();
    },
    methods: {
      getGoodsList(flag) {
        let params = {'page': this.page, 'pageSize': this.pageSize, 'sort': this.sortFlag == true ? 1 : -1};
        axios({
          url: "/goods",
          method: "GET",
          params: params
        }).then(res => {
          if (res.data.status == "0") {
            if (flag) {
              this.goodsList = this.goodsList.concat(res.data.result.list);
              if (res.data.result.count == 0) {
                this.busy = true;
              }else {
                this.busy = false;
              }
            }else {
              this.goodsList = res.data.result.list;
              this.busy = false;
            }
          }else {
            this.goodsList = [];
          }
        });
      },
      setPriceFilter(index) {
        this.priceChecked = index;
        this.closePop();
      },
      showFilterPop() {
        this.filterBy = true;
        this.overLayFlag = true;
      },
      closePop() {
        this.filterBy = false;
        this.overLayFlag = false;
      },
      sortGoods() {
        this.sortFlag = !this.sortFlag;
        this.page = 1;
        this.getGoodsList();
      },
      loadMore() {
        this.busy = true;
        setTimeout(() => {
          this.page++;
          this.busy = false;
          this.getGoodsList(true);
        }, 3000);
      }
    }
  }
</script>
