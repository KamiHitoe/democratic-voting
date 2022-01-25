import Comments from '@/components/Comments.vue'
import { shallowMount } from '@vue/test-utils'


describe('unit test Comments Component', () => {
  const time = new Date;
  const wrapper = shallowMount(Comments, {
    propsData: {
      comment: {
        timestamp: time,
        text: 'test text',
        reply_num: null,
        like_num: 0,
      },
    },
  });
  
  it('render comment object', () => {
    // check contents
    console.log(wrapper.text());
    expect(wrapper.html().text()).toContain(time);
    expect(wrapper.text()).toContain('test text');
    
    // check props
    expect(wrapper.props().comment.text).toMatch('test text');
    expect(wrapper.props().comment.reply_num).toBe(null);
    expect(wrapper.props().comment.like_num).toEqual(0);
  })

});


