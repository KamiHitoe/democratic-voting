import { shallowMount } from "@vue/test-utils";
// import CommentBox from "@/components/comments/CommentBox.vue";

describe("unit test Comment Component", () => {
  const wrapper = shallowMount(CommentBox);
  // this is mock function
  const submitComment = jest.fn();

  it("find subtitle", () => {
    expect(wrapper.find(".subtitle").text()).toMatch("コメントを投稿する");
  });

  it("called function by clicking button", async () => {
    // set mock function
    await wrapper.setMethods({ submitComment });

    // validate button
    wrapper.find(".post-comment").trigger("click");
    expect(submitComment).toBeCalled();
  });
});
