<template>
  <div class="Component ztabshorizontallayout">
    <section class="horizontaltabs" ref="section_element">
      <menu role="horizontaltablist" class="">
        <template v-for="tab_option, tab_option_index in tab_options" >
          <button role="horizontaltab" :aria-selected="selected_tab === tab_option_index" v-bind:key="'option-' + tab_option_index" v-on:click="() => select_tab(tab_option_index)">
            {{ tab_option }}
          </button>
        </template>
      </menu>
      <div class="horizontaltabpanel">
        <slot></slot>
      </div>
    </section>
  </div>
</template>
<script>
  export default {
    props: {
      tabs: {
        prop: Array,
        required: true
      },
      initialSelectedTab: {
        prop: Number,
        default: function() {return 0}
      }
    },
    data() {
      return {
        tab_options: this.tabs,
        selected_tab: -1
      };
    },
    methods: {
      select_tab(tab_index) {
        this.selected_tab = tab_index;
        this.$forceUpdate(true);
      }
    },
    watch: {
      selected_tab(new_value) {
        const all_articles = this.$el.querySelectorAll("section.horizontaltabs > div.horizontaltabpanel > article");
        for(let index=0; index<all_articles.length; index++) {
          const article = all_articles[index];
          article.classList.remove("active");
        }
        const selectable_articles = this.$el.querySelectorAll("section.horizontaltabs > div.horizontaltabpanel > article");
        if(!selectable_articles.length) {
          throw new Error("Required more «article» tags under «ztabshorizontallayout» component to select the tab «" + new_value + "»");
        }
        const selected_article = selectable_articles[new_value];
        selected_article.classList.add("active");
      }
    },
    computed: {},
    beforeCreate() {},
    created() {},
    beforeMount() {},
    mounted() {
      this.selected_tab = this.initialSelectedTab;
    },
    beforeUpdate() {},
    updated() {},
    beforeUnmount() {},
    unmounted() {},
  };
</script>
<style>
  
</style>