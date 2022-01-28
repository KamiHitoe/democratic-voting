import { shallowMount } from "@vue/test-utils";
import RelatedTopics from "@/components/RelatedTopics.vue";

describe("unit test RelatedTopics Component", () => {
  const wrapper = shallowMount(RelatedTopics);

  it("find subtitle", () => {
    expect(wrapper.find(".subtitle").text()).toMatch("関連するお題");
  });
});
