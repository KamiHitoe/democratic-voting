// set state-full object
export const state = () => ({
  parent_id: null,
})

// sync method
export const mutations = {
  updateParentId (state, parent_id) {
    state.parent_id = parent_id
  }
}

// async method
// export const actions = {}

// export const getters = {
//   getParentId: (state) => {
//     return state.parent_id
//   }
// }
