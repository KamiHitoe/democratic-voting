import Test from '@/components/Test.vue'
import { mount } from '@vue/test-utils'

describe('test Test Component', () => {
  const wrapper = mount(Test, {
    propsData: {
      message: 'hey yo!',
    }
  });

  it('has a button', () => {
    expect(wrapper.find('button').exists()).toBe(true);
  });

  console.log('html: ', wrapper.html());
  it('contain text', () => {
    expect(wrapper.html()).toContain('test button');
  });

  console.log('text: ', wrapper.text());
  it('receive props', () => {
    expect(wrapper.text()).toContain('hey yo!');
  })
});


