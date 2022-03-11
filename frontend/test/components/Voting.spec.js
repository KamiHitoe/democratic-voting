import Vuex from "vuex";
import { shallowMount, createLocalVue } from "@vue/test-utils";
import Voting from "@/components/topics/Voting.vue";

// const localVue = createLocalVue()
// localVue.use(Vuex)

// const store = new Vuex.Store({
//   state: {
//     username: "alice"
//   }
// })

describe("unit test Voting Component", () => {
  const wrapper = shallowMount(Voting, {
    propsData: {
      topics: {
        option_1: "やがて君になる",
        option_2: "マリア様がみてる",
        option_3: "ゆるゆり",
        option_4: "Citrus",
      },
    },
    // store,
    // localVue,
    mocks: {
      $store: {
        state: { username: "alice" },
      },
    },
  });
  // this is mock function
  const submitVoting = jest.fn();

  it("called function by clicking button", async () => {
    // set mock function
    await wrapper.setMethods({ submitVoting });

    // validate button
    wrapper.find(".vote-btn").trigger("click");
    expect(submitVoting).toBeCalled();
  });

  it("check props", () => {
    expect(wrapper.props().topics.option_1).toMatch("やがて君になる");
  });
});
