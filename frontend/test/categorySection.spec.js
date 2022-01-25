// import Component, test-utils
import CategorySection from '@/components/CategorySection.vue'
import { shallowMount } from '@vue/test-utils'

describe('unit test categorySection Component', () => {
  const wrapper = shallowMount(CategorySection);
  // const wrapper = shallowMount(CategorySection, {
  //   propsData: {
  //     orgCategories: ['love', 'peace', 'anime'],
  //     categories: [],
  //   },
  // });

  it('find subtitle', () => {
    expect(wrapper.find('.subtitle').text()).toMatch('カテゴリー一覧');
  })

  it('find category in categories', () => {
    expect(wrapper.vm.orgCategories).toBeTruthy();
    expect(wrapper.findAll('p').at(0).text()).toMatch('アニメ・漫画');
    console.log(wrapper.vm.categories);
  })
});


