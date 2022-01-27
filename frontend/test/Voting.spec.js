import Voting from '@/components/Voting.vue'
import { shallowMount } from '@vue/test-utils'

describe('unit test Voting Component', () => {
  const wrapper = shallowMount(Voting, {
    propsData: {
      topics: {
        option_1: 'やがて君になる',
        option_2: 'マリア様がみてる',
        option_3: 'ゆるゆり',
        option_4: 'Citrus',
      },
    },
  });
  // this is mock function
  const submitVoting = jest.fn();

  it('called function by clicking button', async () => {
    // set mock function
    await wrapper.setMethods({ submitVoting });

    // validate button
    wrapper.find('.vote-btn').trigger('click');
    expect(submitVoting).toBeCalled();
  })

  it('check props', () => {
    expect(wrapper.props().topics.option_1).toMatch('やがて君になる');
  })

});


