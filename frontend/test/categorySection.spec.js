import CategorySection from '@/components/CategorySection.vue'
import { mount } from '@vue/test-utils'

describe('test categorySection Component', () => {
  const wrapper = mount(CategorySection);

  it('find h4', () => {
    expect(wrapper.find('h4').exists()).toBe(true);
  })

  it('this has data', () => {
    expect(wrapper.vm.orgCategories).toBeTruthy();
  })
});


