import { shallowMount } from "@vue/test-utils";
import Topics from "@/components/Topics.vue";

describe("unit test Topics Component", () => {
  const time = new Date();
  const wrapper = shallowMount(Topics, {
    propsData: {
      topics: {
        id: 1,
        img_path: null,
        timestamp: time,
        title: "test topic",
        category_id: 1,
      },
      order: 1,
    },
  });

  it("render topic object", () => {
    // check contents
    console.log(wrapper.text());
    expect(wrapper.text()).toContain("test topic");
    expect(wrapper.text()).toContain(String(time));
    expect(wrapper.find(".id").text()).toMatch("1");

    // check props
    expect(wrapper.props().topics.title).toMatch("test topic");
  });
});
